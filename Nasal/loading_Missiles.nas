
#This code is haow to make generic the missile use
var Loading_missile = func(name) {

  var address= "test";
  var NoSmoke = "test2";
  var Explosion = "Aircraft/weapons/smoke/explosion.xml";
  var maxdetectionrngnm =0;
  var fovdeg=0;
  var detectionfovdeg=0;
  var trackmaxdeg=0;
  var maxg=0;
  var thrustlbs=0;
  var thrustdurationsec=0;
  var weightlaunchlbs=0;
  var dragcoeff=0;
  var dragarea=0;
  var maxExplosionRange=0;
  var maxspeed=0;
  var life=0;
  var fox="nothing";
  var rail = "true";
  var cruisealt = 0;

 
  if(name =="Matra MICA"){
    #MICA max range 80 km for actual version. ->43 nm.. at mach 4 it's about 59 sec. I put a life of 120, and thurst duration to 3/4 the travel time, and have vectorial thurst (So 27 G more than a similar missile wich have not vectorial thurst)
    address="Aircraft/weapons/Air-Air/MatraMica/MatraMica_smoke.xml";
    NoSmoke="Aircraft/weapons/Air-Air/MatraMica/MatraMica.xml";
    Explosion="Aircraft/weapons/smoke/explosion.xml";
    #
    maxdetectionrngnm = 45;                    #<!-- Not real Impact yet-->
    fovdeg =25;                                   #<!-- seeker optical FOV -->
    detectionfovdeg=120;                              # <!-- Search pattern diameter (rosette scan) -->
    trackmaxdeg = 110;                               #<!-- Seeker max total angular rotation -->
    maxg = 27;                                       #<!-- In turn --> 
    thrustlbs=517;                                    # <!-- guess -->
    thrustdurationsec =44;                           #<!-- Mk.36 Mod.7,8 -->
    weightlaunchlbs=216;
    weightwarheadlbs=30;
    dragcoeff=0.065;                                   #<!-- guess; original 0.05-->
    dragarea = 0.056;                                 #<!-- sq ft -->
    maxExplosionRange =50;                             #in meter !!<!--Due to the code, more the speed is important, more we need to have this figure high-->
    maxspeed = 4;                                      #<!-- In Mach -->
    life=120;
    fox="Fox1";
    rail = "true";
    cruisealt = 0;
  }elsif(name =="AIM120"){
                #AIM 120 max range 72 km for actual version. ->39 nm.. at mach 4 it's about 53 sec. I put a life of 115, and thurst duration oo 3/4 the travel time.
                    address="Aircraft/Air-Air/Missiles/aim120/AIM-120_smoke.xml";
                    NoSmoke="Aircraft/Air-Air/Missiles/aim120/AIM-120.xml";
					Explosion="Aircraft/weapons/smoke/explosion.xml";
                    #
                    maxdetectionrngnm = 38.8;                         #<!-- Not real Impact yet A little more than the MICA-->
                    fovdeg =25;                                   #<!-- seeker optical FOV -->
                    detectionfovdeg=120;                              # <!-- Search pattern diameter (rosette scan) -->
                    trackmaxdeg = 110;                               #<!-- Seeker max total angular rotation -->
                    maxg = 15;                                       #<!-- In turn less than the MICA, coz it don't have vectorial thurst-->  
                    thrustlbs=701;                                    # <!-- guess -->
                    thrustdurationsec =39;                           #<!-- Mk.36 Mod.7,8 -->
                    weightlaunchlbs=291;
                    weightwarheadlbs=44;
                    dragcoeff=0.088;                                   #<!-- guess; original 0.05-->
                    dragarea = 0.075;                                 #<!-- sq ft -->
                    maxExplosionRange =50;                             #in meter !!<!--Due to the code, more the speed is important, more we need to have this figure high-->
                    maxspeed = 4;                                      #<!-- In Mach -->
                    life=115;
                    fox="Fox1";
                    rail = "false";
                    cruisealt = 0;

  }elsif(name =="Matra R550 Magic 2"){
                #Magic 2 max range 15 km for actual version. ->8 nm.. at mach 2.7 it's about 16 sec. I put a life of 35, and thurst duration to 3/4 the travel time.
                    address="Aircraft/weapons/Air-Air/MatraR550Magic2/MatraR550Magic2_smoke.xml";
                    NoSmoke="Aircraft/weapons/Air-Air/MatraR550Magic2/MatraR550Magic2.xml";
					Explosion="Aircraft/weapons/smoke/explosion.xml";
                    #
                    maxdetectionrngnm = 8;                         #<!-- Not real Impact yet-->
                    fovdeg =25;                                   #<!-- seeker optical FOV -->
                    detectionfovdeg=120;                              # <!-- Search pattern diameter (rosette scan) -->
                    trackmaxdeg = 110;                               #<!-- Seeker max total angular rotation -->
                    maxg = 21;                                       #<!-- In turn --> 
                    thrustlbs=277;                                    # <!-- guess -->
                    thrustdurationsec =12;                           #<!-- Mk.36 Mod.7,8 -->
                    weightlaunchlbs=169;
                    weightwarheadlbs=27;
                    dragcoeff=0.051;                                   #<!-- guess; original 0.05-->
                    dragarea = 0.044;                                 #<!-- sq ft -->
                    maxExplosionRange =40;                             #<!--Due to the code, more the speed is important, more we need to have this figure high-->
                    maxspeed = 2.7;                                      #<!-- In Mach -->
                    life=35;
                    fox="Fox2";
                    rail = "true";
                    cruisealt = 0;

  }elsif(name =="aim-9"){
                #aim-9 max range 18 km for actual version. ->9 nm.. at mach 2.5 it's about 21 sec. I put a life of 40, and thurst duration to 3/4 the travel time.
                    address="Aircraft/weapons/Air-Air/aim9/AIM-9L_smoke.xml";
                    NoSmoke="Aircraft/weapons/Air-Air/aim9/AIM9L.xml";
					Explosion="Aircraft/weapons/smoke/explosion.xml";
                    #
                    maxdetectionrngnm = 9;                         #<!-- Not real Impact yet-->
                    fovdeg =25;                                   #<!-- seeker optical FOV -->
                    detectionfovdeg=120;                              # <!-- Search pattern diameter (rosette scan) -->
                    trackmaxdeg = 110;                               #<!-- Seeker max total angular rotation -->
                    maxg = 21;                                       #<!-- In turn --> 
                    thrustlbs=250;                                    # <!-- guess -->
                    thrustdurationsec = 15;                           #<!-- Mk.36 Mod.7,8 -->
                    weightlaunchlbs=191;
                    weightwarheadlbs=20.8;
                    dragcoeff=0.05;                                   #<!-- guess; original 0.05-->
                    dragarea = 0.043;                                 #<!-- sq ft -->
                    maxExplosionRange =40;                             #<!--Due to the code, more the speed is important, more we need to have this figure high-->
                    maxspeed = 2.5;                                      #<!-- In Mach -->
                    life=44;
                    fox="Fox2";
                    rail = "true";
                    cruisealt = 0;

  
  }elsif(name =="AIM-54"){
                    #aim-54 max range 1884 km for actual version. ->100 nm.. at mach 5 it's about 108 sec. I put a life of 1120, and thurst duration to 3/4 the travel time.
                    address="Aircraft/weapons/Air-Air/aim54/AIM-54_smoke.xml";
                    NoSmoke="Aircraft/weapons/Air-Air/aim54/AIM54.xml";
					Explosion="Aircraft/weapons/smoke/explosion.xml";
                    #
                    maxdetectionrngnm = 100;                      # <!-- Not real Impact yet-->
                    fovdeg =25;                                   # <!-- seeker optical FOV -->
                    detectionfovdeg=120;                           # <!-- Search pattern diameter (rosette scan) -->
                    trackmaxdeg = 110;                            # <!-- Seeker max total angular rotation -->
                    maxg = 30;                                    # <!-- In turn --> 
                    thrustlbs=2722;                               # <!-- guess -->
                    thrustdurationsec =81;                        # <!-- Mk.36 Mod.7,8 -->
                    weightlaunchlbs=905;
                    weightwarheadlbs=135;
                    dragcoeff=0.272;                              # <!-- guess; original 0.05-->
                    dragarea = 0.234;                             # <!-- sq ft -->
                    maxExplosionRange =70;                        # <!--Due to the code, more the speed is important, more we need to have this figure high-->
                    maxspeed = 5;                                 # <!-- In Mach -->
                    life=160;
                    fox="Fox3";
                    rail = "false";
                    cruisealt = 100000;
  }elsif(name =="Meteor"){
                    #Meteor max range 180 km for actual version. ->100 nm.. at mach 5.8 it's about 95 sec. I put a life of 140, and thurst duration to 100% the travel time, and have vectorial thurst (So 35 G more than a similar missile wich have not vectorial thurst)
                    address="Aircraft/weapons/Air-Air/Meteor/Meteor_smoke.xml";
                    NoSmoke="Aircraft/weapons/Air-Air/Meteor/Meteor.xml";
                    Explosion="Aircraft/weapons/smoke/explosion.xml";
                    #
                    maxdetectionrngnm = 100;                    #<!-- Not real Impact yet-->
                    fovdeg =25;                                   #<!-- seeker optical FOV -->
                    detectionfovdeg=120;                              # <!-- Search pattern diameter (rosette scan) -->
                    trackmaxdeg = 110;                               #<!-- Seeker max total angular rotation -->
                    maxg = 35;                                       #<!-- In turn --> 
                    thrustlbs=1200;                                    # <!-- guess -->
                    thrustdurationsec =95;                           #<!-- Mk.36 Mod.7,8 -->
                    weightlaunchlbs=357;
                    weightwarheadlbs=55;
                    dragcoeff=0.065;                                   #<!-- guess; original 0.05-->
                    dragarea = 0.056;                                 #<!-- sq ft -->
                    maxExplosionRange =50;                             #in meter !!<!--Due to the code, more the speed is important, more we need to have this figure high-->
                    maxspeed = 5.8;                                      #<!-- In Mach -->
                    life=140;
                    fox="Fox3";
                    rail = "true";
                    cruisealt = 0;
  }elsif(name =="MATRA-R530"){
                    #MATRA-R530 max range 20 km for actual version. ->10 nm.. at mach 2.7 it's about 20 sec. I put a life of 30, and thurst duration to 3/4 the travel time.
                    address="Aircraft/weapons/Air-Air/MATRA-R530/MATRA-R530_smoke.xml";
                    NoSmoke="Aircraft/weapons/Air-Air/MATRA-R530/MATRA-R530.xml";
					Explosion="Aircraft/weapons/smoke/explosion.xml";
                    #
                    maxdetectionrngnm = 10.8;                     # <!-- Not real Impact yet-->
                    fovdeg =25;                                   # <!-- seeker optical FOV -->
                    detectionfovdeg=120;                           # <!-- Search pattern diameter (rosette scan) -->
                    trackmaxdeg = 110;                            # <!-- Seeker max total angular rotation -->
                    maxg = 15;                                    # <!-- In turn --> 
                    thrustlbs=320;                                # <!-- guess -->  the doc says 17 000 = 83 lbs of thrust...need to readapt all the values.
                    thrustdurationsec =20;                        # <!-- Mk.36 Mod.7,8 -->
                    weightlaunchlbs=357;
                    weightwarheadlbs=55;
                    dragcoeff=0.272;                              # <!-- guess; original 0.05-->
                    dragarea = 0.234;                             # <!-- sq ft -->
                    maxExplosionRange = 40;                       # <!--Due to the code, more the speed is important, more we need to have this figure high-->
                    maxspeed = 2.7;                               # <!-- In Mach -->
                    life=30;
                    fox="Fox2";
                    rail = "false";
                    cruisealt = 0;
  }elsif(name =="R74"){
                    #MATRA-R530 max range 40 km for actual version. ->21 nm.. at mach 2.5 it's about 47 sec. I put a life of 55, and thurst duration to 3/4 the travel time.
                    address="Aircraft/weapons/Air-Air/R74/R-74Smoke.xml";
                    NoSmoke="Aircraft/weapons/Air-Air/R74/R-74.xml";
					Explosion="Aircraft/weapons/smoke/explosion.xml";
                    #
                    maxdetectionrngnm = 10.8;                     # <!-- Not real Impact yet-->
                    fovdeg =25;                                   # <!-- seeker optical FOV -->
                    detectionfovdeg=120;                           # <!-- Search pattern diameter (rosette scan) -->
                    trackmaxdeg = 110;                            # <!-- Seeker max total angular rotation -->
                    maxg = 25;                                    # <!-- In turn --> 
                    thrustlbs=752;                                # <!-- guess -->  the doc says 17 000 = 83 lbs of thrust...need to readapt all the values.
                    thrustdurationsec =35;                        # <!-- Mk.36 Mod.7,8 -->
                    weightlaunchlbs=214;
                    weightwarheadlbs=16;
                    dragcoeff=0.06;                               # <!-- guess; original 0.05-->
                    dragarea = 0.0552;                            # <!-- sq ft -->
                    maxExplosionRange = 40;                       # <!--Due to the code, more the speed is important, more we need to have this figure high-->
                    maxspeed = 2.7;                               # <!-- In Mach -->
                    life=55;
                    fox="Fox3";
                    rail = "false";
                    cruisealt = 0;
  }elsif(name =="aim-9x"){
                     #aim-9x max range 18 km for actual version. ->9 nm.. at mach 2.5 it's about 21 sec. I put a life of 40, and thurst duration to 3/4 the travel time.
                    address="Aircraft/weapons/Air-Air/aim9/AIM-9_smoke.xml";
                    NoSmoke="Aircraft/weapons/Air-Air/aim9/AIM-9.xml";
					Explosion="Aircraft/weapons/smoke/explosion.xml";
                    #
                    maxdetectionrngnm = 9;                         #<!-- Not real Impact yet-->
                    fovdeg =25;                                   #<!-- seeker optical FOV -->
                    detectionfovdeg=120;                              # <!-- Search pattern diameter (rosette scan) -->
                    trackmaxdeg = 110;                               #<!-- Seeker max total angular rotation -->
                    maxg = 21;                                       #<!-- In turn --> 
                    thrustlbs=250;                                    # <!-- guess -->
                    thrustdurationsec = 15;                           #<!-- Mk.36 Mod.7,8 -->
                    weightlaunchlbs=191;
                    weightwarheadlbs=20.8;
                    dragcoeff=0.05;                                   #<!-- guess; original 0.05-->
                    dragarea = 0.043;                                 #<!-- sq ft -->
                    maxExplosionRange =40;                             #<!--Due to the code, more the speed is important, more we need to have this figure high-->
                    maxspeed = 2.5;                                      #<!-- In Mach -->
                    life=44;
                    fox="Fox2";
                    rail = "true";
                    cruisealt = 0;
  
  
  }
  elsif(name =="aim-132"){
                     #aim-132 max range 50 km for actual version. ->9 nm.. at mach 2.5 it's about 21 sec. I put a life of 40, and thurst duration to 3/4 the travel time.
                    address="Aircraft/weapons/Air-Air/aim132/AIM-132_smoke.xml";
                    NoSmoke="Aircraft/weapons/Air-Air/aim132/AIM132.xml";
					Explosion="Aircraft/weapons/smoke/explosion.xml";
                    #
                    maxdetectionrngnm = 9;                         #<!-- Not real Impact yet-->
                    fovdeg =25;                                   #<!-- seeker optical FOV -->
                    detectionfovdeg=120;                              # <!-- Search pattern diameter (rosette scan) -->
                    trackmaxdeg = 110;                               #<!-- Seeker max total angular rotation -->
                    maxg = 21;                                       #<!-- In turn --> 
                    thrustlbs=250;                                    # <!-- guess -->
                    thrustdurationsec = 15;                           #<!-- Mk.36 Mod.7,8 -->
                    weightlaunchlbs=193;
                    weightwarheadlbs=22.2;
                    dragcoeff=0.05;                                   #<!-- guess; original 0.05-->
                    dragarea = 0.043;                                 #<!-- sq ft -->
                    maxExplosionRange =40;                             #<!--Due to the code, more the speed is important, more we need to have this figure high-->
                    maxspeed = 3.1;                                      #<!-- In Mach -->
                    life=44;
                    fox="Fox1";
                    rail = "true";
                    cruisealt = 0;
  
  
  }
  elsif(name =="firestreak"){
                     #firestreak max range 6.4 km for actual version. ->4 miles.. at mach 2.5 it's about 21 sec. I put a life of 40, and thurst duration to 3/4 the travel time.
                    address="Aircraft/weapons/Air-Air/firestreak/firestreak_smoke.xml";
                    NoSmoke="Aircraft/weapons/Air-Air/firestreak/firestreak.xml";
					Explosion="Aircraft/weapons/smoke/explosion.xml";
                    #
                    maxdetectionrngnm = 9;                         #<!-- Not real Impact yet-->
                    fovdeg =25;                                   #<!-- seeker optical FOV -->
                    detectionfovdeg=120;                              # <!-- Search pattern diameter (rosette scan) -->
                    trackmaxdeg = 110;                               #<!-- Seeker max total angular rotation -->
                    maxg = 21;                                       #<!-- In turn --> 
                    thrustlbs=250;                                    # <!-- guess -->
                    thrustdurationsec = 15;                           #<!-- Mk.36 Mod.7,8 -->
                    weightlaunchlbs=300;
                    weightwarheadlbs=50;
                    dragcoeff=0.05;                                   #<!-- guess; original 0.05-->
                    dragarea = 0.043;                                 #<!-- sq ft -->
                    maxExplosionRange =40;                             #<!--Due to the code, more the speed is important, more we need to have this figure high-->
                    maxspeed = 3.0;                                      #<!-- In Mach -->
                    life=44;
                    fox="Fox2";
                    rail = "true";
                    cruisealt = 0;
					
	}				
	 elsif(name =="Iris-t"){
                     #Iris-t max range 25 km for actual version. ->4 miles.. at mach 2.5 it's about 21 sec. I put a life of 40, and thurst duration to 3/4 the travel time.
                    address="Aircraft/weapons/Air-Air/iris-t/iris-t_smoke.xml";
                    NoSmoke="Aircraft/weapons/Air-Air/iris-t/iris-t.xml";
					Explosion="Aircraft/weapons/smoke/explosion.xml";
                    #
                    maxdetectionrngnm = 9;                         #<!-- Not real Impact yet-->
                    fovdeg =25;                                   #<!-- seeker optical FOV -->
                    detectionfovdeg=120;                              # <!-- Search pattern diameter (rosette scan) -->
                    trackmaxdeg = 110;                               #<!-- Seeker max total angular rotation -->
                    maxg = 21;                                       #<!-- In turn --> 
                    thrustlbs=250;                                    # <!-- guess -->
                    thrustdurationsec = 15;                           #<!-- Mk.36 Mod.7,8 -->
                    weightlaunchlbs=192.28;
                    weightwarheadlbs=50;
                    dragcoeff=0.05;                                   #<!-- guess; original 0.05-->
                    dragarea = 0.043;                                 #<!-- sq ft -->
                    maxExplosionRange =40;                             #<!--Due to the code, more the speed is important, more we need to have this figure high-->
                    maxspeed = 3.0;                                      #<!-- In Mach -->
                    life=44;
                    fox="Fox2";
                    rail = "true";
                    cruisealt = 0;
					
	}				
	elsif(name =="R33"){
                     #R-33 max range 160 km for actual version. ->4 miles.. at mach 2.5 it's about 21 sec. I put a life of 40, and thurst duration to 3/4 the travel time.
                    address="Aircraft/weapons/Air-Air/R33/r33_smoke.xml";
                    NoSmoke="Aircraft/weapons/Air-Air/R33/r33_aa9_amos.xml";
					Explosion="Aircraft/weapons/smoke/explosion.xml";
                    #
                    maxdetectionrngnm = 9;                         #<!-- Not real Impact yet-->
                    fovdeg =25;                                   #<!-- seeker optical FOV -->
                    detectionfovdeg=120;                              # <!-- Search pattern diameter (rosette scan) -->
                    trackmaxdeg = 110;                               #<!-- Seeker max total angular rotation -->
                    maxg = 21;                                       #<!-- In turn --> 
                    thrustlbs=250;                                    # <!-- guess -->
                    thrustdurationsec = 15;                           #<!-- Mk.36 Mod.7,8 -->
                    weightlaunchlbs=1080.28;
                    weightwarheadlbs=104;
                    dragcoeff=0.05;                                   #<!-- guess; original 0.05-->
                    dragarea = 0.043;                                 #<!-- sq ft -->
                    maxExplosionRange =40;                             #<!--Due to the code, more the speed is important, more we need to have this figure high-->
                    maxspeed = 4.5;                                      #<!-- In Mach -->
                    life=44;
                    fox="Fox2";
                    rail = "true";
                    cruisealt = 0;
					
	}				
  elsif(name =="R40"){
                     #R-40 max range 60 km for actual version. ->4 miles.. at mach 2.5 it's about 21 sec. I put a life of 40, and thurst duration to 3/4 the travel time.
                    address="Aircraft/weapons/Air-Air/R40/r40_smoke.xml";
                    NoSmoke="Aircraft/weapons/Air-Air/R40/R40.xml";
					Explosion="Aircraft/weapons/smoke/explosion.xml";
                    #
                    maxdetectionrngnm = 9;                         #<!-- Not real Impact yet-->
                    fovdeg =25;                                   #<!-- seeker optical FOV -->
                    detectionfovdeg=120;                              # <!-- Search pattern diameter (rosette scan) -->
                    trackmaxdeg = 110;                               #<!-- Seeker max total angular rotation -->
                    maxg = 21;                                       #<!-- In turn --> 
                    thrustlbs=250;                                    # <!-- guess -->
                    thrustdurationsec = 15;                           #<!-- Mk.36 Mod.7,8 -->
                    weightlaunchlbs=1016;
                    weightwarheadlbs=154;
                    dragcoeff=0.05;                                   #<!-- guess; original 0.05-->
                    dragarea = 0.043;                                 #<!-- sq ft -->
                    maxExplosionRange =40;                             #<!--Due to the code, more the speed is important, more we need to have this figure high-->
                    maxspeed = 4.5;                                      #<!-- In Mach -->
                    life=44;
                    fox="Fox2";
                    rail = "true";
                    cruisealt = 0;
					
	}			
 elsif(name =="R60"){
                     #R-60 max range 8 km for actual version. ->4 miles.. at mach 2.5 it's about 21 sec. I put a life of 40, and thurst duration to 3/4 the travel time.
                    address="Aircraft/weapons/Air-Air/R40/r40_smoke.xml";
                    NoSmoke="Aircraft/weapons/Air-Air/R40/R40.xml";
					Explosion="Aircraft/weapons/smoke/explosion.xml";
                    #
                    maxdetectionrngnm = 9;                         #<!-- Not real Impact yet-->
                    fovdeg =25;                                   #<!-- seeker optical FOV -->
                    detectionfovdeg=120;                              # <!-- Search pattern diameter (rosette scan) -->
                    trackmaxdeg = 110;                               #<!-- Seeker max total angular rotation -->
                    maxg = 21;                                       #<!-- In turn --> 
                    thrustlbs=250;                                    # <!-- guess -->
                    thrustdurationsec = 15;                           #<!-- Mk.36 Mod.7,8 -->
                    weightlaunchlbs=96;
                    weightwarheadlbs=6.6;
                    dragcoeff=0.05;                                   #<!-- guess; original 0.05-->
                    dragarea = 0.043;                                 #<!-- sq ft -->
                    maxExplosionRange =40;                             #<!--Due to the code, more the speed is important, more we need to have this figure high-->
                    maxspeed = 2.7;                                      #<!-- In Mach -->
                    life=44;
                    fox="Fox2";
                    rail = "true";
                    cruisealt = 0;
					
	}
elsif(name =="R77"){
                     #R-77 max range 160 km for actual version. ->4 miles.. at mach 2.5 it's about 21 sec. I put a life of 40, and thurst duration to 3/4 the travel time.
                    address="Aircraft/weapons/Air-Air/R77/r77_smoke.xml";
                    NoSmoke="Aircraft/weapons/Air-Air/R77/R77.xml";
					Explosion="Aircraft/weapons/smoke/explosion.xml";
                    #
                    maxdetectionrngnm = 9;                         #<!-- Not real Impact yet-->
                    fovdeg =25;                                   #<!-- seeker optical FOV -->
                    detectionfovdeg=120;                              # <!-- Search pattern diameter (rosette scan) -->
                    trackmaxdeg = 110;                               #<!-- Seeker max total angular rotation -->
                    maxg = 21;                                       #<!-- In turn --> 
                    thrustlbs=250;                                    # <!-- guess -->
                    thrustdurationsec = 15;                           #<!-- Mk.36 Mod.7,8 -->
                    weightlaunchlbs=497;
                    weightwarheadlbs=48;
                    dragcoeff=0.05;                                   #<!-- guess; original 0.05-->
                    dragarea = 0.043;                                 #<!-- sq ft -->
                    maxExplosionRange =40;                             #<!--Due to the code, more the speed is important, more we need to have this figure high-->
                    maxspeed = 4.5;                                      #<!-- In Mach -->
                    life=44;
                    fox="Fox2";
                    rail = "true";
                    cruisealt = 0;	
  }
  elsif(name =="Stinger"){
                     #R-77 max range 4.8 km for actual version. ->4 miles.. at mach 2.5 it's about 21 sec. I put a life of 40, and thurst duration to 3/4 the travel time.
                    address="Aircraft/weapons/Air-Air/Stinger/Stinger_smoke.xml";
                    NoSmoke="Aircraft/weapons/Air-Air/Stinger/Stinger.xml";
					Explosion="Aircraft/weapons/smoke/explosion.xml";
                    #
                    maxdetectionrngnm = 9;                         #<!-- Not real Impact yet-->
                    fovdeg =25;                                   #<!-- seeker optical FOV -->
                    detectionfovdeg=120;                              # <!-- Search pattern diameter (rosette scan) -->
                    trackmaxdeg = 110;                               #<!-- Seeker max total angular rotation -->
                    maxg = 21;                                       #<!-- In turn --> 
                    thrustlbs=250;                                    # <!-- guess -->
                    thrustdurationsec = 15;                           #<!-- Mk.36 Mod.7,8 -->
                    weightlaunchlbs=33.5;
                    weightwarheadlbs=5;
                    dragcoeff=0.05;                                   #<!-- guess; original 0.05-->
                    dragarea = 0.043;                                 #<!-- sq ft -->
                    maxExplosionRange =40;                             #<!--Due to the code, more the speed is important, more we need to have this figure high-->
                    maxspeed = 2.7;                                      #<!-- In Mach -->
                    life=44;
                    fox="Fox1";
                    rail = "true";
                    cruisealt = 0;
	
	
	}elsif(name =="AGM65"){

                    address="Aircraft/weapons/Air-Ground/agm65/AGM65_smoke.xml";
                    NoSmoke="Aircraft/weapons/Air-Ground/agm65/AGM-65.xml";
                    Explosion="Aircraft/weapons/smoke/explosion.xml";
                    #
                    maxdetectionrngnm = 14;                         #<!-- Not real Impact yet-->
                    fovdeg =25;                                   #<!-- seeker optical FOV -->
                    detectionfovdeg=120;                              # <!-- Search pattern diameter (rosette scan) -->
                    trackmaxdeg = 110;                               #<!-- Seeker max total angular rotation -->
                    maxg = 15;                                       
                    thrustlbs=10000;                                    # <!-- guess -->
                    thrustdurationsec =60;                           #<!-- Mk.36 Mod.7,8 -->
                    weightlaunchlbs=670;
                    weightwarheadlbs=300;
                    dragcoeff=0.157;                                   #<!-- guess; original 0.05-->
                    dragarea = 0.135;                                 #<!-- sq ft -->
                    maxExplosionRange =50;                             #<!--Due to the code, more the speed is important, more we need to have this figure high-->
                    maxspeed =0.9;                                      #<!-- In Mach -->
                    life=90;
                    fox="A/G";
                    rail = "false";
                    cruisealt = 0;

    
  }elsif(name =="SCALP"){

                    address="Aircraft/weapons/Air-Ground/SCALP/SCALP_smoke.xml";
                    NoSmoke="Aircraft/weapons/Air-Ground/SCALP/SCALP.xml";
					Explosion="Aircraft/weapons/smoke/explosion.xml";
                    #
                    maxdetectionrngnm = 135;                         #<!-- Not real Impact yet-->
                    fovdeg =25;                                   #<!-- seeker optical FOV -->
                    detectionfovdeg=120;                              # <!-- Search pattern diameter (rosette scan) -->
                    trackmaxdeg = 110;                               #<!-- Seeker max total angular rotation -->
                    maxg = 15;                                       #<!-- In turn --> 
                    thrustlbs=1500;                                    # <!-- guess -->
                    thrustdurationsec =1000;                           #<!-- Mk.36 Mod.7,8 -->
                    weightlaunchlbs=2711.7;
                    weightwarheadlbs=992;
                    dragcoeff=0.75;                                   #<!-- guess; original 0.05-->
                    dragarea = 0.645;                                 #<!-- sq ft -->
                    maxExplosionRange =90;                             #<!--Due to the code, more the speed is important, more we need to have this figure high-->
                    maxspeed = 0.8;                                      #<!-- In Mach -->
                    life=1000;
                    fox="A/G";
                    rail = "false";
                    cruisealt = 100;

  }elsif(name =="Sea Eagle"){
                    address="Aircraft/weapons/Air-Ground/seaeagle/seaeagle_smoke.xml";
                    NoSmoke="Aircraft/weapons/Air-Ground/seaeagle/seaeagle.xml";
					Explosion="Aircraft/weapons/smoke/explosion.xml";
                    #
                    maxdetectionrngnm = 134;                         #<!-- Not real Impact yet-->
                    fovdeg =25;                                   #<!-- seeker optical FOV -->
                    detectionfovdeg=120;                              # <!-- Search pattern diameter (rosette scan) -->
                    trackmaxdeg = 110;                               #<!-- Seeker max total angular rotation -->
                    maxg = 15;                                       #<!-- In turn --> 
                    thrustlbs=1000;                                    # <!-- guess -->
                    thrustdurationsec =1000;                           #<!-- Mk.36 Mod.7,8 -->
                    weightlaunchlbs=1320;
                    weightwarheadlbs=505;
                    dragcoeff=0.478;                                   #<!-- guess; original 0.05-->
                    dragarea = 0.411;                                 #<!-- sq ft -->
                    maxExplosionRange =80;                             #<!--Due to the code, more the speed is important, more we need to have this figure high-->
                    maxspeed = 0.8;                                      #<!-- In Mach -->
                    life=1000;
                    fox="A/M";
                    rail = "false";
                    cruisealt = 40;				
  
  
  }elsif(name =="AGM12"){

                    address="Aircraft/weapons/Air-Ground/agm12/agm12_smoke.xml";
                    NoSmoke="Aircraft/weapons/Air-Ground/agm12/agm12.xml";
                    Explosion="Aircraft/weapons/smoke/explosion.xml";
                    #
                    maxdetectionrngnm = 14;                         #<!-- Not real Impact yet-->
                    fovdeg =25;                                   #<!-- seeker optical FOV -->
                    detectionfovdeg=120;                              # <!-- Search pattern diameter (rosette scan) -->
                    trackmaxdeg = 110;                               #<!-- Seeker max total angular rotation -->
                    maxg = 15;                                       
                    thrustlbs=30000;                                    # <!-- guess -->
                    thrustdurationsec =60;                           #<!-- Mk.36 Mod.7,8 -->
                    weightlaunchlbs=1785;
                    weightwarheadlbs=250;
                    dragcoeff=0.157;                                   #<!-- guess; original 0.05-->
                    dragarea = 0.135;                                 #<!-- sq ft -->
                    maxExplosionRange =50;                             #<!--Due to the code, more the speed is important, more we need to have this figure high-->
                    maxspeed = 1.8;                                      #<!-- In Mach -->
                    life=90;
                    fox="A/G";
                    rail = "false";
                    cruisealt = 0;
					
	}elsif(name =="AGM62"){

                    address="Aircraft/weapons/Air-Ground/agm62/agm62_smoke.xml";
                    NoSmoke="Aircraft/weapons/Air-Ground/agm62/agm62.xml";
                    Explosion="Aircraft/weapons/smoke/explosion.xml";
                    #
                    maxdetectionrngnm = 14;                         #<!-- Not real Impact yet-->
                    fovdeg =25;                                   #<!-- seeker optical FOV -->
                    detectionfovdeg=120;                              # <!-- Search pattern diameter (rosette scan) -->
                    trackmaxdeg = 110;                               #<!-- Seeker max total angular rotation -->
                    maxg = 15;                                       
                    thrustlbs=30000;                                    # <!-- guess -->
                    thrustdurationsec =60;                           #<!-- Mk.36 Mod.7,8 -->
                    weightlaunchlbs=2345;
                    weightwarheadlbs=2000;
                    dragcoeff=0.157;                                   #<!-- guess; original 0.05-->
                    dragarea = 0.135;                                 #<!-- sq ft -->
                    maxExplosionRange =50;                             #<!--Due to the code, more the speed is important, more we need to have this figure high-->
                    maxspeed = 0.9;                                      #<!-- In Mach -->
                    life=90;
                    fox="A/G";
                    rail = "false";
                    cruisealt = 0;	


}elsif(name =="AGM84"){

                    address="Aircraft/weapons/Air-Ground/agm62/agm84_smoke.xml";
                    NoSmoke="Aircraft/weapons/Air-Ground/agm62/agm84.xml";
                    Explosion="Aircraft/weapons/smoke/explosion.xml";
                    #
                    maxdetectionrngnm = 14;                         #<!-- Not real Impact yet-->
                    fovdeg =25;                                   #<!-- seeker optical FOV -->
                    detectionfovdeg=120;                              # <!-- Search pattern diameter (rosette scan) -->
                    trackmaxdeg = 110;                               #<!-- Seeker max total angular rotation -->
                    maxg = 15;                                       
                    thrustlbs=600;                                    # <!-- guess -->
                    thrustdurationsec =60;                           #<!-- Mk.36 Mod.7,8 -->
                    weightlaunchlbs=1523;
                    weightwarheadlbs=488;
                    dragcoeff=0.157;                                   #<!-- guess; original 0.05-->
                    dragarea = 0.135;                                 #<!-- sq ft -->
                    maxExplosionRange =50;                             #<!--Due to the code, more the speed is important, more we need to have this figure high-->
                    maxspeed = 0.7;                                      #<!-- In Mach -->
                    life=90;
                    fox="A/G";
                    rail = "false";
                    cruisealt = 0;	

}elsif(name =="AGM88"){

                    address="Aircraft/weapons/Air-Ground/agm88/agm88_smoke.xml";
                    NoSmoke="Aircraft/weapons/Air-Ground/agm88/AGM-88.xml";
                    Explosion="Aircraft/weapons/smoke/explosion.xml";
                    #
                    maxdetectionrngnm = 14;                         #<!-- Not real Impact yet-->
                    fovdeg =25;                                   #<!-- seeker optical FOV -->
                    detectionfovdeg=120;                              # <!-- Search pattern diameter (rosette scan) -->
                    trackmaxdeg = 110;                               #<!-- Seeker max total angular rotation -->
                    maxg = 15;                                       
                    thrustlbs=600;                                    # <!-- guess -->
                    thrustdurationsec =60;                           #<!-- Mk.36 Mod.7,8 -->
                    weightlaunchlbs=783;
                    weightwarheadlbs=146;
                    dragcoeff=0.157;                                   #<!-- guess; original 0.05-->
                    dragarea = 0.135;                                 #<!-- sq ft -->
                    maxExplosionRange =50;                             #<!--Due to the code, more the speed is important, more we need to have this figure high-->
                    maxspeed = 1.86;                                      #<!-- In Mach -->
                    life=90;
                    fox="A/G";
                    rail = "false";
                    cruisealt = 0;	

}elsif(name =="AGM114"){

                    address="Aircraft/weapons/Air-Ground/agm114/agm114_smoke.xml";
                    NoSmoke="Aircraft/weapons/Air-Ground/agm114/agm114.xml";
                    Explosion="Aircraft/weapons/smoke/explosion.xml";
                    #
                    maxdetectionrngnm = 14;                         #<!-- Not real Impact yet-->
                    fovdeg =25;                                   #<!-- seeker optical FOV -->
                    detectionfovdeg=120;                              # <!-- Search pattern diameter (rosette scan) -->
                    trackmaxdeg = 110;                               #<!-- Seeker max total angular rotation -->
                    maxg = 15;                                       
                    thrustlbs=600;                                    # <!-- guess -->
                    thrustdurationsec =60;                           #<!-- Mk.36 Mod.7,8 -->
                    weightlaunchlbs=108;
                    weightwarheadlbs=20;
                    dragcoeff=0.157;                                   #<!-- guess; original 0.05-->
                    dragarea = 0.135;                                 #<!-- sq ft -->
                    maxExplosionRange =50;                             #<!--Due to the code, more the speed is important, more we need to have this figure high-->
                    maxspeed = 1.3;                                      #<!-- In Mach -->
                    life=90;
                    fox="A/G";
                    rail = "false";
                    cruisealt = 0;


}elsif(name =="AGM154"){

                    address="Aircraft/weapons/Air-Ground/agm154/agm154_smoke.xml";
                    NoSmoke="Aircraft/weapons/Air-Ground/agm154/agm154.xml";
                    Explosion="Aircraft/weapons/smoke/explosion.xml";
                    #
                    maxdetectionrngnm = 14;                         #<!-- Not real Impact yet-->
                    fovdeg =25;                                   #<!-- seeker optical FOV -->
                    detectionfovdeg=120;                              # <!-- Search pattern diameter (rosette scan) -->
                    trackmaxdeg = 110;                               #<!-- Seeker max total angular rotation -->
                    maxg = 15;                                       
                    thrustlbs=600;                                    # <!-- guess -->
                    thrustdurationsec =60;                           #<!-- Mk.36 Mod.7,8 -->
                    weightlaunchlbs=1095;
                    weightwarheadlbs=100;
                    dragcoeff=0.157;                                   #<!-- guess; original 0.05-->
                    dragarea = 0.135;                                 #<!-- sq ft -->
                    maxExplosionRange =50;                             #<!--Due to the code, more the speed is important, more we need to have this figure high-->
                    maxspeed = 0.9;                                      #<!-- In Mach -->
                    life=90;
                    fox="A/G";
                    rail = "false";
                    cruisealt = 0;	

}elsif(name =="AGM180"){

                    address="Aircraft/weapons/Air-Ground/agm180/agm180_smoke.xml";
                    NoSmoke="Aircraft/weapons/Air-Ground/agm180/agm180.xml";
                    Explosion="Aircraft/weapons/smoke/explosion.xml";
                    #
                    maxdetectionrngnm = 14;                         #<!-- Not real Impact yet-->
                    fovdeg =25;                                   #<!-- seeker optical FOV -->
                    detectionfovdeg=120;                              # <!-- Search pattern diameter (rosette scan) -->
                    trackmaxdeg = 110;                               #<!-- Seeker max total angular rotation -->
                    maxg = 15;                                       
                    thrustlbs=600;                                    # <!-- guess -->
                    thrustdurationsec =60;                           #<!-- Mk.36 Mod.7,8 -->
                    weightlaunchlbs=1095;
                    weightwarheadlbs=100;
                    dragcoeff=0.157;                                   #<!-- guess; original 0.05-->
                    dragarea = 0.135;                                 #<!-- sq ft -->
                    maxExplosionRange =50;                             #<!--Due to the code, more the speed is important, more we need to have this figure high-->
                    maxspeed = 0.9;                                      #<!-- In Mach -->
                    life=90;
                    fox="A/G";
                    rail = "false";
                    cruisealt = 0;	


}elsif(name =="alarm"){

                    address="Aircraft/weapons/Air-Ground/alarm/alarm_smoke.xml";
                    NoSmoke="Aircraft/weapons/Air-Ground/alarm/alarm.xml";
                    Explosion="Aircraft/weapons/smoke/explosion.xml";
                    #
                    maxdetectionrngnm = 14;                         #<!-- Not real Impact yet-->
                    fovdeg =25;                                   #<!-- seeker optical FOV -->
                    detectionfovdeg=120;                              # <!-- Search pattern diameter (rosette scan) -->
                    trackmaxdeg = 110;                               #<!-- Seeker max total angular rotation -->
                    maxg = 15;                                       
                    thrustlbs=600;                                    # <!-- guess -->
                    thrustdurationsec =60;                           #<!-- Mk.36 Mod.7,8 -->
                    weightlaunchlbs=591;
                    weightwarheadlbs=100;
                    dragcoeff=0.157;                                   #<!-- guess; original 0.05-->
                    dragarea = 0.135;                                 #<!-- sq ft -->
                    maxExplosionRange =50;                             #<!--Due to the code, more the speed is important, more we need to have this figure high-->
                    maxspeed = 2;                                      #<!-- In Mach -->
                    life=90;
                    fox="A/G";
                    rail = "false";
                    cruisealt = 0;

}elsif(name =="brimstone"){

                    address="Aircraft/weapons/Air-Ground/brimstone/brimstone_smoke.xml";
                    NoSmoke="Aircraft/weapons/Air-Ground/brimstone/brimstone.xml";
                    Explosion="Aircraft/weapons/smoke/explosion.xml";
                    #
                    maxdetectionrngnm = 14;                         #<!-- Not real Impact yet-->
                    fovdeg =25;                                   #<!-- seeker optical FOV -->
                    detectionfovdeg=120;                              # <!-- Search pattern diameter (rosette scan) -->
                    trackmaxdeg = 110;                               #<!-- Seeker max total angular rotation -->
                    maxg = 15;                                       
                    thrustlbs=600;                                    # <!-- guess -->
                    thrustdurationsec =60;                           #<!-- Mk.36 Mod.7,8 -->
                    weightlaunchlbs=106.7;
                    weightwarheadlbs=30;
                    dragcoeff=0.157;                                   #<!-- guess; original 0.05-->
                    dragarea = 0.135;                                 #<!-- sq ft -->
                    maxExplosionRange =50;                             #<!--Due to the code, more the speed is important, more we need to have this figure high-->
                    maxspeed = 1.3;                                      #<!-- In Mach -->
                    life=90;
                    fox="A/G";
                    rail = "false";
                    cruisealt = 0;	

}elsif(name =="Kh-25"){

                    address="Aircraft/weapons/Air-Ground/kh25/kh-25_smoke.xml";
                    NoSmoke="Aircraft/weapons/Air-Ground/kh25/kh-25.xml";
                    Explosion="Aircraft/weapons/smoke/explosion.xml";
                    #
                    maxdetectionrngnm = 14;                         #<!-- Not real Impact yet-->
                    fovdeg =25;                                   #<!-- seeker optical FOV -->
                    detectionfovdeg=120;                              # <!-- Search pattern diameter (rosette scan) -->
                    trackmaxdeg = 110;                               #<!-- Seeker max total angular rotation -->
                    maxg = 15;                                       
                    thrustlbs=600;                                    # <!-- guess -->
                    thrustdurationsec =60;                           #<!-- Mk.36 Mod.7,8 -->
                    weightlaunchlbs=650;
                    weightwarheadlbs=309;
                    dragcoeff=0.157;                                   #<!-- guess; original 0.05-->
                    dragarea = 0.135;                                 #<!-- sq ft -->
                    maxExplosionRange =50;                             #<!--Due to the code, more the speed is important, more we need to have this figure high-->
                    maxspeed = 1.97;                                      #<!-- In Mach -->
                    life=90;
                    fox="A/G";
                    rail = "false";
                    cruisealt = 0;	

}elsif(name =="Kh-25"){

                    address="Aircraft/weapons/Air-Ground/kh25/kh-25_smoke.xml";
                    NoSmoke="Aircraft/weapons/Air-Ground/kh25/kh-25.xml";
                    Explosion="Aircraft/weapons/smoke/explosion.xml";
                    #
                    maxdetectionrngnm = 14;                         #<!-- Not real Impact yet-->
                    fovdeg =25;                                   #<!-- seeker optical FOV -->
                    detectionfovdeg=120;                              # <!-- Search pattern diameter (rosette scan) -->
                    trackmaxdeg = 110;                               #<!-- Seeker max total angular rotation -->
                    maxg = 15;                                       
                    thrustlbs=600;                                    # <!-- guess -->
                    thrustdurationsec =60;                           #<!-- Mk.36 Mod.7,8 -->
                    weightlaunchlbs=650;
                    weightwarheadlbs=309;
                    dragcoeff=0.157;                                   #<!-- guess; original 0.05-->
                    dragarea = 0.135;                                 #<!-- sq ft -->
                    maxExplosionRange =50;                             #<!--Due to the code, more the speed is important, more we need to have this figure high-->
                    maxspeed = 1.97;                                      #<!-- In Mach -->
                    life=90;
                    fox="A/G";
                    rail = "false";
                    cruisealt = 0;						
					
 }
  #print(address);
  #SetProp
  setprop("controls/armament/missile/address",address);
  setprop("controls/armament/missile/addressNoSmoke",NoSmoke);
  setprop("controls/armament/missile/addressExplosion",Explosion);
  setprop("controls/armament/missile/max-detectionrngnm",maxdetectionrngnm);
  setprop("controls/armament/missile/fov-deg",fovdeg);
  setprop("controls/armament/missile/detection-fov-deg",detectionfovdeg);
  setprop("controls/armament/missile/track-max-deg",trackmaxdeg);
  setprop("controls/armament/missile/thrust-lbs",thrustlbs);
  setprop("controls/armament/missile/max-g",maxg);
  setprop("controls/armament/missile/weight-launch-lbs",weightlaunchlbs);
  setprop("controls/armament/missile/thrust-duration-sec",thrustdurationsec);
  setprop("controls/armament/missile/weight-warhead-lbs",weightwarheadlbs);
  setprop("controls/armament/missile/drag-coeff",dragcoeff);
  setprop("controls/armament/missile/drag-area",dragarea);
  setprop("controls/armament/missile/maxExplosionRange",maxExplosionRange);
  setprop("controls/armament/missile/maxspeed",maxspeed);
  setprop("controls/armament/missile/life",life);
  setprop("controls/armament/missile/fox",fox);
  setprop("controls/armament/missile/rail",rail);
  setprop("controls/armament/missile/cruise_alt",cruisealt);
}
