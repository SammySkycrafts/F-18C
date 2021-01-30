fire_MG = func {
        if(getprop("controls/armament/stick-selector")==1){
          setprop("/controls/armament/trigger", 1);
        }
        if(getprop("controls/armament/stick-selector")==2){
           var pylon = getprop("controls/armament/missile/current-pylon");
           load.dropLoad(pylon);
        }
}

stop_MG = func {
        setprop("/controls/armament/trigger", 0); 
}
var flash_trigger = props.globals.getNode("controls/armament/trigger", 0);

reload_Cannon = func {
        setprop("ai/submodels/submodel/count",670);
        setprop("ai/submodels/submodel[1]/count",670);
        setprop("ai/submodels/submodel[2]/count",670);
        setprop("ai/submodels/submodel[3]/count",670);
}

