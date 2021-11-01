var AcModel        = props.globals.getNode("sim/model/m2000-5");
var OurHdg         = props.globals.getNode("orientation/heading-deg");
var OurRoll        = props.globals.getNode("orientation/roll-deg");
var OurPitch       = props.globals.getNode("orientation/pitch-deg");
#var HudReticleDev  = props.globals.getNode("sim/model/m2000-5/instrumentation/radar-awg-9/hud/reticle-total-deviation", 1);
#var HudReticleDeg  = props.globals.getNode("sim/model/m2000-5/instrumentation/radar-awg-9/hud/reticle-total-angle", 1);

#var SwSoundOnOff   = AcModel.getNode("systems/armament/aim9/sound-on-off");
#var SwSoundVol     = AcModel.getNode("systems/armament/aim9/sound-volume");
#var vol_search     = 0.12;
#var vol_weak_track = 0.20;
#var vol_track      = 0.45;

var g_fps        = 9.80665 * M2FT;
var slugs_to_lbs = 32.1740485564;


var MISSILE = {
        new : func (p) {
                var m = { parents : [MISSILE]};
                # Args: p = Pylon.

                m.status            = 0; # -1 = stand-by, 0 = searching, 1 = locked, 2 = fired.
                m.free              = 0; # 0 = status fired with lock, 1 = status fired but having lost lock.

                #m.prop              = AcModel.getNode("systems/armament/missile/").getChild("msl", 0 , 1);
                #m.PylonIndex        = m.prop.getNode("pylon-index", 1).setValue(p);
                m.NameOfMissile     = getprop("sim/weight["~ p ~"]/selected");
                m.PylonIndex        = p;
                m.ID                = p;
                m.pylon_prop        = props.globals.getNode("sim/").getChild("weight", p);
                m.Tgt               = nil;
                m.TgtValid          = nil;
                m.TgtLon_prop       = nil;
                m.TgtLat_prop       = nil;
                m.TgtAlt_prop       = nil;
                m.TgtHdg_prop       = nil;
                m.update_track_time = 0;
                m.StartTime         = 0;
                m.seeker_dev_e      = 0; # Seeker elevation, deg.
                m.seeker_dev_h      = 0; # Seeker horizon, deg.
                m.curr_tgt_e        = 0;
                m.curr_tgt_h        = 0;
                m.init_tgt_e        = 0;
                m.init_tgt_h        = 0;
                m.target_dev_e      = 0; # Target elevation, deg.
                m.target_dev_h      = 0; # Target horizon, deg.
                m.track_signal_e    = 0; # Seeker deviation change to keep constant angle (proportional navigation),
                m.track_signal_h    = 0; #   this is directly used as input signal for the steering command.
                m.t_coord           = geo.Coord.new().set_latlon(0, 0, 0);
                m.last_t_coord      = m.t_coord;
                #m.next_t_coord      = m.t_coord;
                m.direct_dist_m     = nil;
                m.diveToken      = 0;        #this is for cruise missile. when the token is 1, the dive can start....
                m.total_speed_ft = 1;
                m.vApproch       = 1;
                m.tpsApproch     = 0;
                m.nextGroundElevation = 0; #Next Ground Elevation in 2 dt

                # missile specs:
                m.missile_model     =  getprop("controls/armament/missile/address");
                m.missile_NoSmoke   =  getprop("controls/armament/missile/addressNoSmoke");
                m.missile_Explosion =  getprop("controls/armament/missile/addressExplosion");
                m.missile_fov_diam  = getprop("controls/armament/missile/fov-deg");
                m.missile_fov       = m.missile_fov_diam  / 2;
                m.max_detect_rng    = getprop("controls/armament/missile/max-detection-rng-nm");
                m.max_seeker_dev    = getprop("controls/armament/missile/track-max-deg") / 2;
                m.force_lbs         = getprop("controls/armament/missile/thrust-lbs");
                m.thrust_duration   = getprop("controls/armament/missile/thrust-duration-sec");
                m.weight_launch_lbs = getprop("controls/armament/missile/weight-launch-lbs");
                m.weight_whead_lbs  = getprop("controls/armament/missile/weight-warhead-lbs");
                m.cd                = getprop("controls/armament/missile/drag-coeff");
                m.eda               = getprop("controls/armament/missile/drag-area");
                m.max_g             = getprop("controls/armament/missile/max-g");
                m.maxExplosionRange = getprop("controls/armament/missile/maxExplosionRange");
                m.maxSpeed          = getprop("controls/armament/missile/maxspeed");
                m.Life              = getprop("controls/armament/missile/life");
                m.fox               = getprop("controls/armament/missile/fox");# for messaging but also for the missile's detection capability (not implemented Yet)
                m.rail              = getprop("controls/armament/missile/rail");
                m.cruisealt         = getprop("controls/armament/missile/cruise_alt");
                m.last_coord       = nil;



                # Find the next index for "models/model" and create property node.
                # Find the next index for "ai/models/missile" and create property node.
                # (M. Franz, see Nasal/tanker.nas)
                var n = props.globals.getNode("models", 1);
                for (var i = 0; 1; i += 1)
                        if (n.getChild("model", i, 0) == nil)
                                break;
                m.model = n.getChild("model", i, 1);
                var n = props.globals.getNode("ai/models", 1);
                for (var i = 0; 1; i += 1)
                        if (n.getChild("missile", i, 0) == nil)
                                break;
                m.ai = n.getChild("missile", i, 1);

                m.ai.getNode("valid", 1).setBoolValue(1);
                var id_model = m.missile_model;
                m.model.getNode("path", 1).setValue(id_model);
                m.life_time = 0;

                # Create the AI position and orientation properties.
                m.latN   = m.ai.getNode("position/latitude-deg", 1);
                m.lonN   = m.ai.getNode("position/longitude-deg", 1);
                m.altN   = m.ai.getNode("position/altitude-ft", 1);
                m.hdgN   = m.ai.getNode("orientation/true-heading-deg", 1);
                m.pitchN = m.ai.getNode("orientation/pitch-deg", 1);
                m.rollN  = m.ai.getNode("orientation/roll-deg", 1);

                m.ac      = nil;
                m.coord   = geo.Coord.new().set_latlon(0, 0, 0);
                m.s_down  = nil;
                m.s_east  = nil;
                m.s_north = nil;
                m.alt     = nil;
                m.pitch   = 0;
                m.hdg     = nil;

                #SwSoundOnOff.setValue(1);

                #settimer(func { SwSoundVol.setValue(vol_search); m.search() }, 1);
                return MISSILE.active[m.ID] = m;

        },
        del: func {
                me.model.remove();
                me.ai.remove();
                if(me.free == 1){
                        var phrase = me.NameOfMissile ~ " Report : Missed";
                        if (getprop("sim/model/m2000-5/systems/armament/mp-messaging")=="true") {
                        setprop("/sim/multiplay/chat", phrase);
                        } else {
                        setprop("/sim/messages/atc", phrase);
                        }
                }
                delete(MISSILE.active, me.ID);
        },
        reload_model: func(path) {
                #Delete the current model
                me.model.remove();

                #Find the new model index
                var n = props.globals.getNode("models", 1);
                for (var i = 0; 1; i += 1)
                        if (n.getChild("model", i, 0) == nil)
                                break;
                me.model = n.getChild("model", i, 1);

                #Put value in model
                me.model.getNode("path", 1).setValue(path);
                me.model.getNode("latitude-deg-prop", 1).setValue(me.latN.getPath());
                me.model.getNode("longitude-deg-prop", 1).setValue(me.lonN.getPath());
                me.model.getNode("elevation-ft-prop", 1).setValue(me.altN.getPath());
                me.model.getNode("heading-deg-prop", 1).setValue(me.hdgN.getPath());
                me.model.getNode("pitch-deg-prop", 1).setValue(me.pitchN.getPath());
                me.model.getNode("roll-deg-prop", 1).setValue(me.rollN.getPath());
                me.model.getNode("load", 1).remove();

        },

        release: func() {
                me.status = 2;
                #me.animation_flags_props();

                # Get the A/C position and orientation values.
                me.ac = geo.aircraft_position();
                var ac_roll  = getprop("orientation/roll-deg");
                var ac_pitch = getprop("orientation/pitch-deg");
                var ac_hdg   = getprop("orientation/heading-deg");

                # Compute missile initial position relative to A/C center,
                # following Vivian's code in AIModel/submodel.cxx .
                var in = [0,0,0];
                var trans = [[0,0,0],[0,0,0],[0,0,0]];
                var out = [0,0,0];

                in[0] = me.pylon_prop.getNode("offsets/x-m").getValue() * M2FT;
                in[1] = me.pylon_prop.getNode("offsets/y-m").getValue() * M2FT;
                in[2] = me.pylon_prop.getNode("offsets/z-m").getValue() * M2FT;
                # Pre-process trig functions:
                cosRx = math.cos(-ac_roll * D2R);
                sinRx = math.sin(-ac_roll * D2R);
                cosRy = math.cos(-ac_pitch * D2R);
                sinRy = math.sin(-ac_pitch * D2R);
                cosRz = math.cos(ac_hdg * D2R);
                sinRz = math.sin(ac_hdg * D2R);
                # Set up the transform matrix:
                trans[0][0] =  cosRy * cosRz;
                trans[0][1] =  -1 * cosRx * sinRz + sinRx * sinRy * cosRz ;
                trans[0][2] =  sinRx * sinRz + cosRx * sinRy * cosRz;
                trans[1][0] =  cosRy * sinRz;
                trans[1][1] =  cosRx * cosRz + sinRx * sinRy * sinRz;
                trans[1][2] =  -1 * sinRx * cosRx + cosRx * sinRy * sinRz;
                trans[2][0] =  -1 * sinRy;
                trans[2][1] =  sinRx * cosRy;
                trans[2][2] =  cosRx * cosRy;
                # Multiply the input and transform matrices:
                out[0] = in[0] * trans[0][0] + in[1] * trans[0][1] + in[2] * trans[0][2];
                out[1] = in[0] * trans[1][0] + in[1] * trans[1][1] + in[2] * trans[1][2];
                out[2] = in[0] * trans[2][0] + in[1] * trans[2][1] + in[2] * trans[2][2];
                # Convert ft to degrees of latitude:
                out[0] = out[0] / (366468.96 - 3717.12 * math.cos(me.ac.lat() * D2R));
                # Convert ft to degrees of longitude:
                out[1] = out[1] / (365228.16 * math.cos(me.ac.lat() * D2R));
                # Set submodel initial position:
                var alat = me.ac.lat() + out[0];
                var alon = me.ac.lon() + out[1];
                var aalt = (me.ac.alt() * M2FT) + out[2];
                me.latN.setDoubleValue(alat);
                me.lonN.setDoubleValue(alon);
                me.altN.setDoubleValue(aalt);
                me.hdgN.setDoubleValue(ac_hdg);
                me.pitchN.setDoubleValue(ac_pitch);
                me.rollN.setDoubleValue(ac_roll);

                me.coord.set_latlon(alat, alon, me.ac.alt());

                me.model.getNode("latitude-deg-prop", 1).setValue(me.latN.getPath());
                me.model.getNode("longitude-deg-prop", 1).setValue(me.lonN.getPath());
                me.model.getNode("elevation-ft-prop", 1).setValue(me.altN.getPath());
                me.model.getNode("heading-deg-prop", 1).setValue(me.hdgN.getPath());
                me.model.getNode("pitch-deg-prop", 1).setValue(me.pitchN.getPath());
                me.model.getNode("roll-deg-prop", 1).setValue(me.rollN.getPath());
                me.model.getNode("load", 1).remove();

                # Get initial velocity vector (aircraft):
                me.s_down = getprop("velocities/speed-down-fps");
                me.s_east = getprop("velocities/speed-east-fps");
                me.s_north = getprop("velocities/speed-north-fps");

                me.alt = aalt;
                me.pitch = ac_pitch;
                me.hdg = ac_hdg;

                #me.smoke_prop.setBoolValue(1);
                #SwSoundVol.setValue(0);
                #settimer(func { HudReticleDeg.setValue(0) }, 2);
                #interpolate(HudReticleDev, 0, 2);
                
                me.StartTime = props.globals.getNode("/sim/time/elapsed-sec", 1).getValue();

                var phrase =  me.fox ~ " at " ~ me.Tgt.get_Callsign() ~ ". Release " ~ me.NameOfMissile;
                if (getprop("sim/model/m2000-5/systems/armament/mp-messaging")=="true") {
                        setprop("/sim/multiplay/chat", phrase);
                } else {
                        setprop("/sim/messages/atc", phrase);
                }

                me.update();

        },





        update: func {
                var dt = getprop("sim/time/delta-sec");
                var init_launch = 0;
                if ( me.life_time > 0 ) { init_launch = 1 }
                me.life_time += dt;
                # record coords so we can give the latest nearest position for impact.
                me.last_coord = geo.Coord.new().set_latlon(me.coord.lat(), me.coord.lon(), me.coord.alt());


                #### Calculate speed vector before steering corrections.

                # Cut rocket thrust after boost duration.
                var f_lbs = me.force_lbs;
                if(me.rail=="true"){
                        if (me.life_time > 2) { f_lbs = me.force_lbs * 0.3; }
                }else{
                        f_lbs = 0;
                        if (me.life_time > 1) { f_lbs = me.force_lbs; }
                        if (me.life_time > 3) { f_lbs = me.force_lbs * 0.3; }
                }
                #This do not work for the moment... need to know how to reload a 3D model...
                if (me.life_time > me.thrust_duration) {
                                   var Dapath = me.missile_NoSmoke;
                                   if(me.model.getNode("path", 1).getValue() != Dapath){
                                        #print(Dapath);
                                        me.reload_model(Dapath);
                                   }
                                   #print( me.model.getNode("path", 1).getValue());
                                   f_lbs = 0; 
                                   #me.smoke_prop.setBoolValue(0); 
                }

                # Kill the AI after a while.
                if (me.life_time > me.Life) { me.free = 1; return me.del(); }

                # Get total speed.
                var d_east_ft  = me.s_east * dt;
                var d_north_ft = me.s_north * dt;
                var d_down_ft  = me.s_down * dt;
                var pitch_deg  = me.pitch;
                var hdg_deg    = me.hdg;
                var dist_h_ft  = math.sqrt((d_east_ft*d_east_ft)+(d_north_ft*d_north_ft));
                var total_s_ft = math.sqrt((dist_h_ft*dist_h_ft)+(d_down_ft*d_down_ft));

                # Get air density and speed of sound (fps):
                var alt_ft = me.altN.getValue();
                var rs = environment.rho_sndspeed(alt_ft);
                var rho = rs[0];
                var sound_fps = rs[1];

                # Adjust Cd by Mach number. The equations are based on curves
                # for a conventional shell/bullet (no boat-tail).
                var cdm = 0;
                var speed_m = (total_s_ft / dt) / sound_fps;
                #print(speed_m);
                if (speed_m < 0.7) cdm = 0.0125 * speed_m + me.cd;
                elsif (speed_m < 1.2 ) cdm = 0.3742 * math.pow(speed_m, 2) - 0.252 * speed_m + 0.0021 + me.cd;
                else cdm = 0.2965 * math.pow(speed_m, -1.1506) + me.cd;

                # Add drag to the total speed using Standard Atmosphere (15C sealevel temperature);
                # rho is adjusted for altitude in environment.rho_sndspeed(altitude),
                # Acceleration = thrust/mass - drag/mass;
                var mass = me.weight_launch_lbs / slugs_to_lbs;
                var old_speed_fps = total_s_ft / dt;

                var acc = f_lbs / mass;

                var drag_acc = (cdm * 0.5 * rho * old_speed_fps * old_speed_fps * me.eda / mass);

                #Here is a limit for not "Go over" the theoric max speed of the missile
                if(speed_m > me.maxSpeed){
                        var speed_fps = old_speed_fps - drag_acc;
                }else{
                        var speed_fps = old_speed_fps - drag_acc + acc;
                }

                #print("acc: ",acc," _drag_acc: ",drag_acc);

                # Break down total speed to North, East and Down components.
                var speed_down_fps = math.sin(pitch_deg * D2R) * speed_fps;
                var speed_horizontal_fps = math.cos(pitch_deg * D2R) * speed_fps;
                var speed_north_fps = math.cos(hdg_deg * D2R) * speed_horizontal_fps;
                var speed_east_fps = math.sin(hdg_deg * D2R) * speed_horizontal_fps;

               

                # Add gravity to the vertical speed (no ground interaction yet).
                speed_down_fps -= 32.1740485564 * dt;

                
                # Calculate altitude and elevation velocity vector (no incidence here).
                var alt_ft = me.altN.getValue() + (speed_down_fps * dt);
                pitch_deg = math.atan2( speed_down_fps, speed_horizontal_fps ) * R2D;
                me.pitch = pitch_deg;
                
                var dist_h_m = speed_horizontal_fps * dt * FT2M;


                #### Guidance.

                if ( me.status == 2 and me.free == 0) {
                        me.update_track();
                        if (init_launch == 0 ) {
                                 #Use the rail or a/c pitch for the first frame.
                                pitch_deg = getprop("orientation/pitch-deg");
                        } else {
                                #Here will be set the max angle of pitch and the max angle of heading to avoid G overload
                                     var myG = steering_speed_G(me.track_signal_e, me.track_signal_h, (total_s_ft / dt), mass, dt);
                                     if(me.max_g < myG){
                                        print("MyG");
                                        var MyCoef = max_G_Rotation(me.track_signal_e, me.track_signal_h, total_s_ft, mass, 1,me.max_g);
                                        me.track_signal_e =  me.track_signal_e * MyCoef;
                                        me.track_signal_h =  me.track_signal_h * MyCoef;
                                        myG = steering_speed_G(me.track_signal_e, me.track_signal_h, (total_s_ft / dt), mass, dt);
                                     }
                                        pitch_deg += me.track_signal_e;
                                        hdg_deg += me.track_signal_h;

                                

                                #print("Still Tracking : Elevation ",me.track_signal_e,"Heading ",me.track_signal_h," Gload : ", myG );
                        }
                        
                }
        
                #print("status :",me.status,"free ",me.free,"init_launch : ", init_launch);
                #print("**Altitude : ",alt_ft, " NextGroundElevation : ", me.nextGroundElevation,"Heading : " ,hdg_deg," **Pitch : ",pitch_deg, "**Speed : " ,speed_m, " dt :",dt );
                

                # Get horizontal distance and set position and orientation.
                var dist_h_m = speed_horizontal_fps * dt * FT2M;
                me.coord.apply_course_distance(hdg_deg, dist_h_m);
                me.latN.setDoubleValue(me.coord.lat());
                me.lonN.setDoubleValue(me.coord.lon());
                me.altN.setDoubleValue(alt_ft);
                me.coord.set_alt(alt_ft);
                me.pitchN.setDoubleValue(pitch_deg);
                me.hdgN.setDoubleValue(hdg_deg);


                #This is for ground detection fr A/G cruise missile
                if(alt_ft<1000){
                        var geoPlus2 = nextGeoloc(me.coord.lat(),me.coord.lon(),me.hdg,total_s_ft*FT2M,2);
                        me.nextGroundElevation = geo.elevation(geoPlus2.lat(),geoPlus2.lon());
                }

                #### Proximity detection.

                if ( me.status == 2 ) {
                        var v = me.poximity_detection();
                        if ( ! v ) {
                                # We exploded, but need a few more secs to spawn the explosion animation.
                                settimer(func { me.del(); }, 4 );
                                print("booom");
                                return;
                        }                        
                        if(me.life_time > 3){
                                #### If not exploded, check if the missile can keep the lock.
                                 if ( me.free == 0 ) {
                                        var g = steering_speed_G(me.track_signal_e, me.track_signal_h, (total_s_ft / dt), mass, dt);
                                        if ( g > me.max_g ) {
                                                # Target unreachable, fly free.
                                                me.free = 1;
                                                print("Too much G");
                                                #Disable for the moment
                                        }
                                }
                         }

                        ####Ground interaction
                        var ground = geo.elevation(me.coord.lat(),me.coord.lon());
                        #print("Ground :",ground);
                        if(ground != nil){
                                if(ground>alt_ft){
                                        print("Ground");
                                        me.free = 1;
                                        settimer(func { me.del(); }, 1 );
                                        return;
                                }
                         }
                       
                        
                }
                # record the velocities for the next loop.
                me.s_north = speed_north_fps;
                me.s_east = speed_east_fps;
                me.s_down = speed_down_fps;
                me.total_speed_ft = total_s_ft;
                me.alt = alt_ft;
                me.pitch = pitch_deg;
                me.hdg = hdg_deg;
                if (me.life_time < me.Life){settimer(func me.update(), 0);}
                
        },






        update_track: func() {
                if ( me.Tgt == nil ) { return(1); }
                if (me.status == 0) {
                        # Status = searching.
                        #me.reset_seeker();
                        #SwSoundVol.setValue(vol_search);
                        #settimer(func me.search(), 0.1);
                        return(1);
                }
                if ( me.status == -1 ) {
                        # Status = stand-by.
                        #me.reset_seeker();
                        #SwSoundVol.setValue(0);
                        return(1);
                }
                #if (!me.Tgt.Valid.getValue()) {
                        # Lost of lock due to target disapearing:
                        # return to search mode.
                        #me.status = 0;
                        #me.reset_seeker();
                        #SwSoundVol.setValue(vol_search);
                        #settimer(func me.search(), 0.1);
                        #return(1);
                #}
                # Time interval since lock time or last track loop.
                var time = props.globals.getNode("/sim/time/elapsed-sec", 1).getValue();
                var dt = time - me.update_track_time;
                me.update_track_time = time;
                var last_tgt_e = me.curr_tgt_e;
                var last_tgt_h = me.curr_tgt_h;
                if (me.status == 1) {                
                        # Status = locked. Get target position relative to our aircraft.
                        me.curr_tgt_e = me.Tgt.get_total_elevation(OurPitch.getValue());
                        me.curr_tgt_h = me.Tgt.get_deviation(OurHdg.getValue());
                } else {
                        # Status = launched. Compute target position relative to seeker head.

                        # Get target position.
                        var t_alt =  me.Tgt.get_altitude();
                        
                        #var previsionSpeed = (me.Tgt.get_Speed()*0.5144) *(me.Tgt.get_Speed()*0.5144) / (me.total_speed_ft *FT2M);
                        var previsionSpeed = (me.Tgt.get_Speed()*0.5144) *(me.Tgt.get_Speed()*0.5144) / (me.vApproch);
                        

                        var nextGeo = nextGeoloc(me.Tgt.get_Latitude(),me.Tgt.get_Longitude(),me.Tgt.get_heading(),previsionSpeed,1);
                        var next_alt = math.tan(me.Tgt.get_Pitch()*D2R)*nextGeo.distance_to(geo.Coord.new().set_latlon(me.Tgt.get_Latitude(),me.Tgt.get_Longitude()))*M2FT+t_alt;

                        t_alt = next_alt;
                        me.t_coord.set_latlon(nextGeo.lat(),nextGeo.lon(), t_alt);  #me.t_coord.set_latlon(me.Tgt.get_Latitude(),me.Tgt.get_Longitude(), t_alt);


                        
                        #print("Alt: ",t_alt," Lat",me.Tgt.get_Latitude()," Long : ",me.Tgt.get_Longitude());


                        # Calculate current target elevation and azimut deviation.
                        var t_dist_m = me.coord.distance_to(me.t_coord);
                        var t_alt_delta_m = (t_alt - me.alt) * FT2M;
                        var t_elev_deg =  math.atan2( t_alt_delta_m, t_dist_m ) * R2D;
                        #print("DeltaElevation ",t_alt_delta_m);

                        ###Cruise mode control :
                        if(me.cruisealt != 0){
                                
                                #This is for Air to ground cruise missile (SCALP, Taurus, Tomawank...)
                                if(me.cruisealt<10000){
                                        var Daground = 0;
                                        if(me.fox=="A/G"){ Daground = me.nextGroundElevation;}
                                        if(t_dist_m>500){ #It's 1 or 2 seconds for this kinds of missiles...
                                                var t_alt_delta_m = (me.cruisealt+Daground - me.alt) * FT2M;
                                                if(me.cruisealt+Daground>me.alt){
                                                        var t_elev_deg =  math.atan2( t_alt_delta_m, 200 ) * R2D;  #200 is for a very short reaction to terrain
                                                }else{
                                                        var t_elev_deg =  math.atan2( t_alt_delta_m, me.alt*2 ) * R2D;  #That means a dive angle of 22.5° (a bit less coz me.alt is in feet)
                                                }
                                        }else{
                                                        var t_elev_deg =  math.atan2( t_alt_delta_m + 8, t_dist_m ) * R2D; #We put 8 feet up the target to avoid ground at the last minute...
                                        }

                                }else{
                                        #Other kind of cruise missile like AIM54, perhaps METEOR ?
                                        if(me.diveToken==0){ #First, get cruise altitude. at mach 5, 20km is done in 10 seconds...
                                                        var t_alt_delta_m = (me.cruisealt - me.alt) * FT2M;
                                                        var t_elev_deg =  math.atan2( t_alt_delta_m, t_alt_delta_m * 2 ) * R2D;
                                                        if(me.cruisealt - me.alt <100){me.diveToken =1;} 
                                                        #print("Direct distance",me.coord.direct_distance_to(me.t_coord), " t_dist_m",t_dist_m);
                                        }
                                }
                        }
                        
                        me.curr_tgt_e = t_elev_deg - me.pitch;



                        #print(me.curr_tgt_e);
                        var t_course = me.coord.course_to(me.t_coord);
                        me.curr_tgt_h = t_course - me.hdg;

                        # Compute gain to reduce target deviation to match an optimum 3 deg
                        # This augments steering by an additional 10 deg per second during
                        # the trajectory first 2 seconds.
                        # Then, keep track of deviations at the end of these two initial 2 seconds.
                        var e_gain = 1;
                        var h_gain = 1;
                                #if(me.rail=="true" or me.life_time >2)
                        #if ( me.life_time < 3 ) {
                                #if (me.curr_tgt_e > 3 or me.curr_tgt_e < - 3) {
                                        #e_gain = 1 + (0.1 * dt);
                                #}
                                #if (me.curr_tgt_h > 3 or me.curr_tgt_h < - 3) {
                                        #h_gain = 1 + (0.1 * dt);
                                #}
                                me.init_tgt_e = 0; #last_tgt_e;
                                me.init_tgt_h = 0; #last_tgt_h;                        
                        #}

                        if ( me.update_track_time-me.StartTime < 3 ) {
                                        e_gain = (me.update_track_time-me.StartTime-1)/2;
                                        h_gain = (me.update_track_time-me.StartTime-1)/2;                
                        }
                        if ( me.update_track_time-me.StartTime < 1 ) {
                                        e_gain = 0;
                                        h_gain = 0;                
                        }
                        #print((me.update_track_time-me.StartTime-1)/2);
                        # Compute target deviation variation then seeker move to keep this deviation constant.
                        me.track_signal_e = (me.curr_tgt_e - me.init_tgt_e) * e_gain;
                        me.track_signal_h = (me.curr_tgt_h - me.init_tgt_h) * h_gain;
                        
#print(" me.track_signal_e = ", me.track_signal_e," me.track_signal_h = ", me.track_signal_h);
#print ("**** curr_tgt_e = ", me.curr_tgt_e," curr_tgt_h = ", me.curr_tgt_h, " me.track_signal_e = ", me.track_signal_e," me.track_signal_h = ", me.track_signal_h);


                }
                # Compute HUD reticle position.
                if ( me.status == 1 ) {
                        var h_rad = (90 - me.curr_tgt_h) * D2R;
                        var e_rad = (90 - me.curr_tgt_e) * D2R; 
                        #var devs = f14_hud.develev_to_devroll(h_rad, e_rad);
                        #var combined_dev_deg = devs[0];
                        #var combined_dev_length =  devs[1];
                        #var clamped = devs[2];
                        #if ( clamped ) { SW_reticle_Blinker.blink();}
                        #else { SW_reticle_Blinker.cont();}
                        #HudReticleDeg.setValue(combined_dev_deg);
                        #HudReticleDev.setValue(combined_dev_length);
                }
                if ( me.status != 2 and me.status != -1 ) {
                        me.check_t_in_fov();
                        # We are not launched yet: update_track() loops by itself at 10 Hz.
                        #SwSoundVol.setValue(vol_track);
                        
                }
                if(me.status==2 and me.free == 0 and  me.life_time > me.Life){
                        settimer(func me.update_track(), 0.1);
                }
                return(1);
        },




        poximity_detection: func {
                me.t_coord.set_latlon(me.Tgt.get_Latitude(),me.Tgt.get_Longitude(), me.Tgt.get_altitude());
                var cur_dir_dist_m = me.coord.direct_distance_to(me.t_coord);
                var BC = cur_dir_dist_m;
                var AC = me.direct_dist_m;
                if(me.last_coord != nil){ var AB = me.last_coord.direct_distance_to(me.coord);}
#        
#         A_______C'______ B
#          \      |      /                We have a system  :   x²   = CB² - C'B²
#           \     |     /                                       C'B  = AB  - AC'
#            \    |x   /                                        AC'² = A'C² + x²
#             \   |   /
#              \  |  /                    Then, if I made no mistake : x² = BC² - ((BC²-AC²+AB²)/(2AB))²
#               \ | /
#                \|/
#                 C
#C is the target. A is the last missile positioin and B tha actual. For very high speed (more than 1000 m /seconds) we need to know if,
#between the position A and the position B, the distance x to the target is enough short to proxiimity detection.

                

                # Get current direct distance.
                #print("me.direct_dist_m = ",me.direct_dist_m);
                
                
                if ( me.direct_dist_m != nil ) {

                        var x2 = BC*BC - (((BC*BC-AC*AC+AB*AB)/(2*AB))*((BC*BC-AC*AC+AB*AB)/(2*AB)));
                        if(BC*BC - x2< AB*AB  ){ #This is to check if AC' < AB
                                if(x2 > 0){ 
                                        cur_dir_dist_m = math.sqrt(x2);
                                }
                                #print( " Dist=",y3, "AC =",AC," AB=",AB," BC=",BC);
                        }

                        #print(me.last_coord.alt());
                        #print("cur_dir_dist_m = ",cur_dir_dist_m," me.direct_dist_m = ",me.direct_dist_m);


                 if(me.tpsApproch ==0){
                        me.tpsApproch = props.globals.getNode("/sim/time/elapsed-sec", 1).getValue();
                 }else{
                        me.vApproch = (me.direct_dist_m-cur_dir_dist_m)/(props.globals.getNode("/sim/time/elapsed-sec", 1).getValue()-me.tpsApproch);
                        me.tpsApproch = props.globals.getNode("/sim/time/elapsed-sec", 1).getValue();
                        #print(me.vApproch);
                 }

                 if ( cur_dir_dist_m > me.direct_dist_m and me.direct_dist_m< me.maxExplosionRange * 2) {
                                if( me.direct_dist_m < me.maxExplosionRange){
                                        # Distance to target increase, trigger explosion.
                                        # Get missile relative position to the target at last frame.
                                        var t_bearing_deg = me.last_t_coord.course_to(me.last_coord);
                                        var t_delta_alt_m = me.last_coord.alt() - me.last_t_coord.alt();
                                        var new_t_alt_m = me.t_coord.alt() + t_delta_alt_m;
                                        var t_dist_m  = math.sqrt(math.abs((me.direct_dist_m * me.direct_dist_m)-(t_delta_alt_m * t_delta_alt_m)));
                                        # Create impact coords from this previous relative position applied to target current coord.
                                        me.t_coord.apply_course_distance(t_bearing_deg, t_dist_m);
                                        me.t_coord.set_alt(new_t_alt_m);                
                                        var wh_mass = me.weight_whead_lbs / slugs_to_lbs;
                                        print("FOX2: me.direct_dist_m = ",  me.direct_dist_m, " time ",getprop("sim/time/elapsed-sec"));
                                        impact_report(me.t_coord, wh_mass, "missile"); # pos, alt, mass_slug,(speed_mps)
                                        var phrase =   me.Tgt.get_Callsign() ~ " has been hit by " ~ me.NameOfMissile ~ ". Distance of impact " ~ sprintf( "%01.0f", me.direct_dist_m) ~ " meters";
                                        if (getprop("sim/model/m2000-5/systems/armament/mp-messaging")=="true") {
                                                setprop("/sim/multiplay/chat", phrase);
                                        } else {
                                                setprop("/sim/messages/atc", phrase);
                                        }
                                        me.animate_explosion();
                                        me.Tgt = nil;
                                        return(0);
                                }else{
                                        if(me.life_time > 3 and me.free == 0){ #You don't have a second chance. Missile missed
                                                me.free = 1;
                                        }
                                }
                        }
                }
                me.last_t_coord = me.t_coord;
                me.direct_dist_m = cur_dir_dist_m;
                return(1);
        },



        check_t_in_fov: func {
                # Used only when not launched.
                # Compute seeker total angular position clamped to seeker max total angular rotation.
                me.seeker_dev_e += me.track_signal_e;
                me.seeker_dev_e = me.clamp_min_max(me.seeker_dev_e, me.max_seeker_dev);
                me.seeker_dev_h += me.track_signal_h;
                me.seeker_dev_h = me.clamp_min_max(me.seeker_dev_h, me.max_seeker_dev);
                # Check target signal inside seeker FOV.
                var e_d = me.seeker_dev_e - me.aim9_fov;
                var e_u = me.seeker_dev_e + me.aim9_fov;
                var h_l = me.seeker_dev_h - me.aim9_fov;
                var h_r = me.seeker_dev_h + me.aim9_fov;
                if ( me.curr_tgt_e < e_d or me.curr_tgt_e > e_u or me.curr_tgt_h < h_l or me.curr_tgt_h > h_r ) {                
                        # Target out of FOV while still not launched, return to search loop.
                        me.status = 0;
                        #settimer(func me.search(), 2);
                        me.Tgt = nil;
                        SwSoundVol.setValue(vol_search);
                        me.reset_seeker();
                }
                return(1);
        },


        search: func (c){
                                var tgt = c;

                                var total_elev  = tgt.get_total_elevation(OurPitch.getValue()); # deg.
                                var total_horiz = tgt.get_deviation(OurHdg.getValue());         # deg.
                                # Check if in range and in the (square shaped here) seeker FOV.
                               var abs_total_elev = math.abs(total_elev);
                               var abs_dev_deg = math.abs(total_horiz);

                                me.status = 1;
                                me.Tgt = tgt;

                                me.TgtLon_prop       = getprop("/ai/closest/longitude");
                                me.TgtLat_prop       = getprop("/ai/closest/latitude");
                                me.TgtAlt_prop       = getprop("/ai/closest/altitude");
                                me.TgtHdg_prop       = getprop("/ai/closest/heading");
                                if(me.free == 0 and me.life_time > me.Life){
                                        settimer(func me.update_track(), 2);
                                }
        },

        reset_steering: func {
                me.track_signal_e = 0;
                me.track_signal_h = 0;
        },

        reset_seeker: func {
                me.curr_tgt_e     = 0;
                me.curr_tgt_h     = 0;
                me.seeker_dev_e   = 0;
                me.seeker_dev_h   = 0;
                #settimer(func { HudReticleDeg.setValue(0) }, 2);
                interpolate(HudReticleDev, 0, 2);
                me.reset_steering()
        },

        clamp_min_max: func (v, mm) {
                if ( v < -mm ) {
                        v = -mm;
                } elsif ( v > mm ) {
                        v = mm;
                }
        return(v);
        },


##To be corrected...
        animation_flags_props: func {
                # Create animation flags properties.
                var msl_path = "armament/MatraMICA/flags/msl-id-" ~ me.ID;
                me.msl_prop = props.globals.initNode( msl_path, 1, "BOOL" );
                var smoke_path = "armament/MatraMICA/flags/smoke-id-" ~ me.ID;
                me.smoke_prop = props.globals.initNode( smoke_path, 0, "BOOL" );
                var explode_path = "armament/MatraMICA/flags/explode-id-" ~ me.ID;
                me.explode_prop = props.globals.initNode( explode_path, 0, "BOOL" );
                var explode_smoke_path = "armament/MatraMICA/flags/explode-smoke-id-" ~ me.ID;
                me.explode_smoke_prop = props.globals.initNode( explode_smoke_path, 0, "BOOL" );
        },
        animate_explosion: func {
                var Dapath = me.missile_Explosion;
                if(me.model.getNode("path", 1).getValue() != Dapath){
                        #print(Dapath);
                        me.reload_model(Dapath);
                }
                #me.msl_prop.setBoolValue(0);
                #me.smoke_prop.setBoolValue(0);
                #me.explode_prop.setBoolValue(1);
                #settimer( func me.explode_prop.setBoolValue(0), 0.5 );
                #settimer( func me.explode_smoke_prop.setBoolValue(1), 0.5 );
                #settimer( func me.explode_smoke_prop.setBoolValue(0), 3 );
        },
        active: {},
};


# Create impact report.

#altitde-agl-ft DOUBLE
#impact
#        elevation-m DOUBLE
#        heading-deg DOUBLE
#        latitude-deg DOUBLE
#        longitude-deg DOUBLE
#        pitch-deg DOUBLE
#        roll-deg DOUBLE
#        speed-mps DOUBLE
#        type STRING
#valid "true" BOOL


var impact_report = func(pos, mass_slug, string) {

        # Find the next index for "ai/models/model-impact" and create property node.
        var n = props.globals.getNode("ai/models", 1);
        for (var i = 0; 1; i += 1)
                if (n.getChild(string, i, 0) == nil)
                        break;
        var impact = n.getChild(string, i, 1);

        impact.getNode("impact/elevation-m", 1).setValue(pos.alt()*FT2M);
        impact.getNode("impact/latitude-deg", 1).setValue(pos.lat());
        impact.getNode("impact/longitude-deg", 1).setValue(pos.lon());
        impact.getNode("mass-slug", 1).setValue(mass_slug);
        #impact.getNode("speed-mps", 1).setValue(speed_mps);
        impact.getNode("valid", 1).setBoolValue(1);
        impact.getNode("impact/type", 1).setValue("terrain");

        var impact_str = "/ai/models/" ~ string ~ "[" ~ i ~ "]";
        setprop("ai/models/model-impact", impact_str);
}

steering_speed_G = func(steering_e_deg, steering_h_deg, s_fps, mass, dt) {
        # Get G number from steering (e, h) in deg, speed in ft/s and mass in slugs.
        var steer_deg = math.sqrt((steering_e_deg*steering_e_deg)+(steering_h_deg*steering_h_deg));
        var radius_ft = math.abs(s_fps / math.cos((90 - steer_deg)*D2R));
        var g = (mass * s_fps * s_fps / radius_ft * dt) / g_fps;
        #print("#### R = ", radius_ft, " G = ", g);
        return(g);
}

var max_G_Rotation = func(steering_e_deg, steering_h_deg, s_fps, mass, dt,gMax) {
        # Get G number from steering (e, h) in deg, speed in ft/s and mass in slugs.
        #This function is for calculate the maximum angle without overload G

        var steer_deg = math.sqrt((steering_e_deg*steering_e_deg)+(steering_h_deg*steering_h_deg));
        var radius_ft = math.abs(s_fps / math.cos(90 - steer_deg));
        var g = (mass * s_fps * s_fps / radius_ft * dt) / g_fps;

         #Isolation of Radius
        if(s_fps<1){s_fps=1;}
        var radius_ft2 =(mass * s_fps * s_fps * dt)/((gMax*0.9) * g_fps);
        if(math.abs(s_fps/radius_ft2)<1){
                var steer_rad_theoric = math.acos(math.abs(s_fps/radius_ft2));
                var steer_deg_theoric = 90 - (steer_rad_theoric * R2D);
        }else{
                var steer_rad_theoric = 1;
                var steer_deg_theoric = 1;
        }

        var radius_ft_th = math.abs(s_fps / math.cos((90 -steer_deg_theoric)*D2R));
        var g_th = (mass * s_fps * s_fps / radius_ft_th * dt) / g_fps;

        #print ("Max G ",gMax , " Actual G " , g,"steer_deg_theoric ",steer_deg_theoric);

        return(steer_deg_theoric/steer_deg);
}

# HUD clamped target blinker
SW_reticle_Blinker = aircraft.light.new("sim/model/f-14b/lighting/hud-sw-reticle-switch", [0.1, 0.1]);
#setprop("sim/model/f-14b/lighting/hud-sw-reticle-switch/enabled", 1);

var nextGeoloc =func (long,lat, heading, speed, dt){

        #long & lat & heading, in degree, sppeed in nm 
        #This function should send back the futures long lat

        var distance = speed * dt ; #should be a distance in meters

        #print("distance ", distance);

        #Much simpler than trigo
        var NextGeo = geo.Coord.new().set_latlon(long, lat, 100);
        NextGeo.apply_course_distance(heading,distance);

        return NextGeo;

}

var MPReport = func () {
        if (getprop("sim/model/m2000-5/systems/armament/mp-messaging")=="true") {
                setprop("sim/model/m2000-5/systems/armament/mp-messaging","false");
        }else{
                setprop("sim/model/m2000-5/systems/armament/mp-messaging","true");
        }
        var phrase = "MP messaging : " ~ getprop("sim/model/m2000-5/systems/armament/mp-messaging");
        setprop("/sim/messages/atc", phrase);
}
