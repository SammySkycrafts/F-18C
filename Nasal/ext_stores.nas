

#On verifie et on largue
var dropTanks = func(){
        for(var i = 2 ;i < 5 ; i = i + 1 ){
           var select = getprop("sim/weight["~ i ~"]/selected");
           if(select == "droptank"){ load.dropLoad(i);}

        }
}


var clean = func() {
       



        setprop("sim/weight[0]/selected", "NONE");
        setprop("sim/weight[1]/selected", "NONE");
        setprop("sim/weight[2]/selected", "NONE");
        setprop("sim/weight[3]/selected", "NONE");
		setprop("sim/weight[4]/selected", "NONE");
		setprop("sim/weight[5]/selected", "NONE");
        setprop("sim/weight[6]/selected", "NONE");
		setprop("sim/weight[7]/selected", "NONE");
		setprop("sim/weight[8]/selected", "NONE");
		setprop("sim/weight[9]/selected", "NONE");
		setprop("sim/weight[10]/selected", "NONE");
		setprop("sim/weight[11]/selected", "NONE");
		setprop("sim/weight[12]/selected", "NONE");
		


}


var Ferry = func() {
        setprop("consumables/fuel/tank[4]/selected", 0);
        setprop("consumables/fuel/tank[4]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[4]/level-gal_us", 0);
		setprop("consumables/fuel/tank[5]/selected", 0);
        setprop("consumables/fuel/tank[5]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[5]/level-gal_us", 0);
        setprop("consumables/fuel/tank[6]/selected", 0);
        setprop("consumables/fuel/tank[6]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[6]/level-gal_us", 0);



        setprop("sim/weight[0]/selected", "AIM-9");
        setprop("sim/weight[1]/selected", "NONE");
        setprop("sim/weight[2]/selected", "330 Gal Droptank");
        setprop("sim/weight[3]/selected", "NONE");
		setprop("sim/weight[4]/selected", "NONE");
		setprop("sim/weight[5]/selected", "NONE");
        setprop("sim/weight[6]/selected", "330 Gal Droptank");
		setprop("sim/weight[7]/selected", "NONE");
		setprop("sim/weight[8]/selected", "NONE");
		setprop("sim/weight[9]/selected", "NONE");
		setprop("sim/weight[10]/selected", "330 Gal Droptank");
		setprop("sim/weight[11]/selected", "NONE");
		setprop("sim/weight[12]/selected", "AIM-9");
		setprop("consumables/fuel/tank[4]/selected", 1);
        setprop("consumables/fuel/tank[4]/capacity-gal_us", 330);
        setprop("consumables/fuel/tank[4]/level-gal_us", 330);
		setprop("consumables/fuel/tank[5]/selected", 1);
        setprop("consumables/fuel/tank[5]/capacity-gal_us", 330);
        setprop("consumables/fuel/tank[5]/level-gal_us", 330);
		setprop("consumables/fuel/tank[6]/selected", 1);
        setprop("consumables/fuel/tank[6]/capacity-gal_us", 330);
        setprop("consumables/fuel/tank[6]/level-gal_us", 330);


}



var CAP = func(){

        setprop("consumables/fuel/tank[4]/selected", 0);
        setprop("consumables/fuel/tank[4]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[4]/level-gal_us", 0);
		setprop("consumables/fuel/tank[5]/selected", 0);
        setprop("consumables/fuel/tank[5]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[5]/level-gal_us", 0);
        setprop("consumables/fuel/tank[6]/selected", 0);
        setprop("consumables/fuel/tank[6]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[6]/level-gal_us", 0);



        setprop("sim/weight[0]/selected", "AIM-9");
        setprop("sim/weight[1]/selected", "2x AIM-9");
        setprop("sim/weight[2]/selected", "2x AIM-120");
        setprop("sim/weight[3]/selected", "NONE");
		setprop("sim/weight[4]/selected", "NONE");
		setprop("sim/weight[5]/selected", "AIM-7");
        setprop("sim/weight[6]/selected", "330 Gal Droptank");
		setprop("sim/weight[7]/selected", "AIM-7");
		setprop("sim/weight[8]/selected", "NONE");
		setprop("sim/weight[9]/selected", "NONE");
		setprop("sim/weight[10]/selected", "2x AIM-120");
		setprop("sim/weight[11]/selected", "2x AIM-9");
		setprop("sim/weight[12]/selected", "AIM-9");
		
       
		setprop("consumables/fuel/tank[5]/selected", 1);
        setprop("consumables/fuel/tank[5]/capacity-gal_us", 330);
        setprop("consumables/fuel/tank[5]/level-gal_us", 330);
		

}

var CAPext = func(){

        setprop("consumables/fuel/tank[4]/selected", 0);
        setprop("consumables/fuel/tank[4]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[4]/level-gal_us", 0);
		setprop("consumables/fuel/tank[5]/selected", 0);
        setprop("consumables/fuel/tank[5]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[5]/level-gal_us", 0);
        setprop("consumables/fuel/tank[6]/selected", 0);
        setprop("consumables/fuel/tank[6]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[6]/level-gal_us", 0);



        setprop("sim/weight[0]/selected", "AIM-9");
        setprop("sim/weight[1]/selected", "2x AIM-120");
        setprop("sim/weight[2]/selected", "330 Gal Droptank");
        setprop("sim/weight[3]/selected", "NONE");
		setprop("sim/weight[4]/selected", "NONE");
		setprop("sim/weight[5]/selected", "AIM-7");
        setprop("sim/weight[6]/selected", "330 Gal Droptank");
		setprop("sim/weight[7]/selected", "AIM-7");
		setprop("sim/weight[8]/selected", "NONE");
		setprop("sim/weight[9]/selected", "NONE");
		setprop("sim/weight[10]/selected", "330 Gal Droptank");
		setprop("sim/weight[11]/selected", "2x AIM-9");
		setprop("sim/weight[12]/selected", "AIM-9");
		
        setprop("consumables/fuel/tank[4]/selected", 1);
        setprop("consumables/fuel/tank[4]/capacity-gal_us", 330);
        setprop("consumables/fuel/tank[4]/level-gal_us", 330);
		setprop("consumables/fuel/tank[5]/selected", 1);
        setprop("consumables/fuel/tank[5]/capacity-gal_us", 330);
        setprop("consumables/fuel/tank[5]/level-gal_us", 330);
		setprop("consumables/fuel/tank[6]/selected", 1);
        setprop("consumables/fuel/tank[6]/capacity-gal_us", 330);
        setprop("consumables/fuel/tank[6]/level-gal_us", 330);

}

var bomb = func() {
        setprop("consumables/fuel/tank[4]/selected", 0);
        setprop("consumables/fuel/tank[4]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[4]/level-gal_us", 0);
		setprop("consumables/fuel/tank[5]/selected", 0);
        setprop("consumables/fuel/tank[5]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[5]/level-gal_us", 0);
        setprop("consumables/fuel/tank[6]/selected", 0);
        setprop("consumables/fuel/tank[6]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[6]/level-gal_us", 0);



        setprop("sim/weight[0]/selected", "AIM-9");
        setprop("sim/weight[1]/selected", "2x MK-82");
        setprop("sim/weight[2]/selected", "2x MK-83");
        setprop("sim/weight[3]/selected", "NONE");
		setprop("sim/weight[4]/selected", "NONE");
		setprop("sim/weight[5]/selected", "AIM-7");
        setprop("sim/weight[6]/selected", "2x MK-82");
		setprop("sim/weight[7]/selected", "AIM-7");
		setprop("sim/weight[8]/selected", "NONE");
		setprop("sim/weight[9]/selected", "NONE");
		setprop("sim/weight[10]/selected", "2x MK-83");
		setprop("sim/weight[11]/selected", "2x MK-82");
		setprop("sim/weight[12]/selected", "AIM-9");
		
        


}

var bombext = func() {
        setprop("consumables/fuel/tank[4]/selected", 0);
        setprop("consumables/fuel/tank[4]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[4]/level-gal_us", 0);
		setprop("consumables/fuel/tank[5]/selected", 0);
        setprop("consumables/fuel/tank[5]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[5]/level-gal_us", 0);
        setprop("consumables/fuel/tank[6]/selected", 0);
        setprop("consumables/fuel/tank[6]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[6]/level-gal_us", 0);



        setprop("sim/weight[0]/selected", "AIM-9");
        setprop("sim/weight[1]/selected", "2x MK-82");
        setprop("sim/weight[2]/selected", "2x MK-83");
        setprop("sim/weight[3]/selected", "NONE");
		setprop("sim/weight[4]/selected", "NONE");
		setprop("sim/weight[5]/selected", "AIM-7");
        setprop("sim/weight[6]/selected", "330 Gal Droptank");
		setprop("sim/weight[7]/selected", "AIM-7");
		setprop("sim/weight[8]/selected", "NONE");
		setprop("sim/weight[9]/selected", "NONE");
		setprop("sim/weight[10]/selected", "2x MK-83");
		setprop("sim/weight[11]/selected", "2x MK-82");
		setprop("sim/weight[12]/selected", "AIM-9");
		
		
		setprop("consumables/fuel/tank[5]/selected", 1);
        setprop("consumables/fuel/tank[5]/capacity-gal_us", 330);
        setprop("consumables/fuel/tank[5]/level-gal_us", 330);

}


var lgb = func() {
        setprop("consumables/fuel/tank[4]/selected", 0);
        setprop("consumables/fuel/tank[4]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[4]/level-gal_us", 0);
		setprop("consumables/fuel/tank[5]/selected", 0);
        setprop("consumables/fuel/tank[5]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[5]/level-gal_us", 0);
        setprop("consumables/fuel/tank[6]/selected", 0);
        setprop("consumables/fuel/tank[6]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[6]/level-gal_us", 0);



        setprop("sim/weight[0]/selected", "AIM-9");
        setprop("sim/weight[1]/selected", "GBU-10");
        setprop("sim/weight[2]/selected", "GBU-16");
        setprop("sim/weight[3]/selected", "NONE");
		setprop("sim/weight[4]/selected", "NONE");
		setprop("sim/weight[5]/selected", "AIM-7");
        setprop("sim/weight[6]/selected", "330 Gal Droptank");
		setprop("sim/weight[7]/selected", "AIM-7");
		setprop("sim/weight[8]/selected", "NONE");
		setprop("sim/weight[9]/selected", "NONE");
		setprop("sim/weight[10]/selected", "GBU-16");
		setprop("sim/weight[11]/selected", "GBU-10");
		setprop("sim/weight[12]/selected", "AIM-9");
		
		
		setprop("consumables/fuel/tank[5]/selected", 1);
        setprop("consumables/fuel/tank[5]/capacity-gal_us", 330);
        setprop("consumables/fuel/tank[5]/level-gal_us", 330);

}


var agm = func() {
        setprop("consumables/fuel/tank[4]/selected", 0);
        setprop("consumables/fuel/tank[4]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[4]/level-gal_us", 0);
		setprop("consumables/fuel/tank[5]/selected", 0);
        setprop("consumables/fuel/tank[5]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[5]/level-gal_us", 0);
        setprop("consumables/fuel/tank[6]/selected", 0);
        setprop("consumables/fuel/tank[6]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[6]/level-gal_us", 0);



        setprop("sim/weight[0]/selected", "AIM-9");
        setprop("sim/weight[1]/selected", "AGM-65");
        setprop("sim/weight[2]/selected", "AGM-62");
        setprop("sim/weight[3]/selected", "NONE");
		setprop("sim/weight[4]/selected", "NONE");
		setprop("sim/weight[5]/selected", "AIM-7");
        setprop("sim/weight[6]/selected", "330 Gal Droptank");
		setprop("sim/weight[7]/selected", "AIM-7");
		setprop("sim/weight[8]/selected", "NONE");
		setprop("sim/weight[9]/selected", "NONE");
		setprop("sim/weight[10]/selected", "AGM-62");
		setprop("sim/weight[11]/selected", "AGM-65");
		setprop("sim/weight[12]/selected", "AIM-9");
		
		
		setprop("consumables/fuel/tank[5]/selected", 1);
        setprop("consumables/fuel/tank[5]/capacity-gal_us", 330);
        setprop("consumables/fuel/tank[5]/level-gal_us", 330);

}

var cruse = func() {
        setprop("consumables/fuel/tank[4]/selected", 0);
        setprop("consumables/fuel/tank[4]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[4]/level-gal_us", 0);
		setprop("consumables/fuel/tank[5]/selected", 0);
        setprop("consumables/fuel/tank[5]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[5]/level-gal_us", 0);
        setprop("consumables/fuel/tank[6]/selected", 0);
        setprop("consumables/fuel/tank[6]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[6]/level-gal_us", 0);



        setprop("sim/weight[0]/selected", "AIM-9");
        setprop("sim/weight[1]/selected", "AGM-154");
        setprop("sim/weight[2]/selected", "AGM-154");
        setprop("sim/weight[3]/selected", "NONE");
		setprop("sim/weight[4]/selected", "NONE");
		setprop("sim/weight[5]/selected", "AIM-7");
        setprop("sim/weight[6]/selected", "330 Gal Droptank");
		setprop("sim/weight[7]/selected", "AIM-7");
		setprop("sim/weight[8]/selected", "NONE");
		setprop("sim/weight[9]/selected", "NONE");
		setprop("sim/weight[10]/selected", "AGM-154");
		setprop("sim/weight[11]/selected", "AGM-154");
		setprop("sim/weight[12]/selected", "AIM-9");
		
		
		setprop("consumables/fuel/tank[5]/selected", 1);
        setprop("consumables/fuel/tank[5]/capacity-gal_us", 330);
        setprop("consumables/fuel/tank[5]/level-gal_us", 330);

}

var ship = func() {
        setprop("consumables/fuel/tank[4]/selected", 0);
        setprop("consumables/fuel/tank[4]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[4]/level-gal_us", 0);
		setprop("consumables/fuel/tank[5]/selected", 0);
        setprop("consumables/fuel/tank[5]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[5]/level-gal_us", 0);
        setprop("consumables/fuel/tank[6]/selected", 0);
        setprop("consumables/fuel/tank[6]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[6]/level-gal_us", 0);



        setprop("sim/weight[0]/selected", "AIM-9");
        setprop("sim/weight[1]/selected", "AGM-84");
        setprop("sim/weight[2]/selected", "AGM-84");
        setprop("sim/weight[3]/selected", "NONE");
		setprop("sim/weight[4]/selected", "NONE");
		setprop("sim/weight[5]/selected", "AIM-7");
        setprop("sim/weight[6]/selected", "330 Gal Droptank");
		setprop("sim/weight[7]/selected", "AIM-7");
		setprop("sim/weight[8]/selected", "NONE");
		setprop("sim/weight[9]/selected", "NONE");
		setprop("sim/weight[10]/selected", "AGM-84");
		setprop("sim/weight[11]/selected", "AGM-84");
		setprop("sim/weight[12]/selected", "AIM-9");
		
		
		setprop("consumables/fuel/tank[5]/selected", 1);
        setprop("consumables/fuel/tank[5]/capacity-gal_us", 330);
        setprop("consumables/fuel/tank[5]/level-gal_us", 330);

}

var radar = func() {
        setprop("consumables/fuel/tank[4]/selected", 0);
        setprop("consumables/fuel/tank[4]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[4]/level-gal_us", 0);
		setprop("consumables/fuel/tank[5]/selected", 0);
        setprop("consumables/fuel/tank[5]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[5]/level-gal_us", 0);
        setprop("consumables/fuel/tank[6]/selected", 0);
        setprop("consumables/fuel/tank[6]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[6]/level-gal_us", 0);



        setprop("sim/weight[0]/selected", "AIM-9");
        setprop("sim/weight[1]/selected", "AGM-88");
        setprop("sim/weight[2]/selected", "AGM-88");
        setprop("sim/weight[3]/selected", "NONE");
		setprop("sim/weight[4]/selected", "NONE");
		setprop("sim/weight[5]/selected", "AIM-7");
        setprop("sim/weight[6]/selected", "330 Gal Droptank");
		setprop("sim/weight[7]/selected", "AIM-7");
		setprop("sim/weight[8]/selected", "NONE");
		setprop("sim/weight[9]/selected", "NONE");
		setprop("sim/weight[10]/selected", "AGM-88");
		setprop("sim/weight[11]/selected", "AGM-88");
		setprop("sim/weight[12]/selected", "AIM-9");
		
		
		setprop("consumables/fuel/tank[5]/selected", 1);
        setprop("consumables/fuel/tank[5]/capacity-gal_us", 330);
        setprop("consumables/fuel/tank[5]/level-gal_us", 330);

}

#La boite de dialogue
var ext_loads_dlg = gui.Dialog.new("dialog","Aircraft/F-15-ACTIVE/Dialogs/external-loads.xml");

#Begining of the dropable function.
#It has to be simplified and generic made
#Need to know how to make a table
dropLoad = func (number) {
          var select = getprop("sim/weight["~ number ~"]/selected");
          if(select != "none"){
                if(select == "Droptank"){
                     tank_submodel(number,select);
                     setprop("consumables/fuel/tank["~ number ~"]/selected", 0);
                     settimer(func load.dropLoad_stop(number),2);
                     setprop("controls/armament/station["~ number ~"]/release", 1);
                     setprop("sim/weight["~ number ~"]/selected", "none");
                     setprop("sim/weight["~ number ~"]/weight-lb", 0);
                }else{
                     load.dropMissile(number);
                     settimer(func load.dropLoad_stop(number),0.5);
                }


           }

           
}


#Need to be changed
dropLoad_stop = func(n) {     
         setprop("controls/armament/station["~ n ~"]/release", 0);
}





dropMissile = func (number) { 

  var target  = hud.closest_target();
  if(target == nil){ return;}

  
        #print(typeMissile);


          var typeMissile = getprop("sim/weight["~ number ~"]/selected");
          missile.Loading_missile(typeMissile);
          Current_missile = missile.MISSILE.new(number);
          Current_missile.status = 0;
          Current_missile.search(target);             
          Current_missile.release();
          setprop("controls/armament/station["~ number ~"]/release", 1);
          setprop("sim/weight["~ number ~"]/selected", "none");
          setprop("sim/weight["~ number ~"]/weight-lb", 0);
     

}

var tank_submodel = func (pylone, select){

        #Drop Tanks
        if(pylone == 1 and select == "Droptank"){ setprop("controls/armament/station[1]/release-droptank", 1);}
        if(pylone == 4 and select == "Droptank"){ setprop("controls/armament/station[5]/release-droptank", 1);}
        if(pylone == 7 and select == "Droptank"){ setprop("controls/armament/station[9]/release-droptank", 1);}


}




