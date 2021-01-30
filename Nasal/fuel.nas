# simple fuelsystem
# this will use fuel from external tanks first. 
# while refueling all tanks are selected

# Adapted from Eurofighter Typhoon code, by Aster

props.globals.initNode("systems/refuel/refueling", 0, "BOOL");
props.globals.initNode("systems/refuel/refueling_grnd", 0, "BOOL");

var fueltanks = props.globals.getNode("consumables/fuel").getChildren("tank");
var engine = props.globals.getNode("controls/engines").getChildren("engine");
var fueltanks = props.globals.getNode("consumables/fuel").getChildren("tank");
var wow = getprop ("/gear/gear[0]/wow");
var parked = getprop("controls/gear/brake-parking");
var refueling_grnd = props.globals.getNode("systems/refuel/refueling_grnd"); 
var refueling = props.globals.getNode("systems/refuel/refueling"); 

setlistener("systems/refuel/contact", func(n) {
	if (n.getValue() == 1) {
		refueling.setValue(1);
		foreach(f; fueltanks) {
			f.getNode("selected", 1).setBoolValue(1);
		}
	} else {
		refueling.setValue(0);
	}
},1);

# accessible from menu:
var fillup = func {
		if (wow and parked) {
		foreach(f; fueltanks) {		
		var cap 	= f.getNode("capacity-gal_us");
		var level = f.getNode("level-gal_us");
		if (cap.getValue() > level.getValue()) {
			refueling_grnd.setValue(1);
			f.getNode("selected", 1).setBoolValue(1);
			interpolate(f.getNode("level-gal_us"), cap.getValue(), 20);
			} 
		}	
		settimer( func refueling_grnd.setValue(0), 20);
	}	
}

var fuelTanks = func {
	if (refueling.getValue() == 0 and refueling_grnd.getValue() == 0) {

	var levelDropStbd = getprop("consumables/fuel/tank[6]/level-gal_us");
		if(levelDropStbd == nil) { levelDropStbd = 0; }
		var levelDropPort = getprop("consumables/fuel/tank[4]/level-gal_us");
		if(levelDropPort == nil) { levelDropPort = 0; }
		var levelDropCentr = getprop("consumables/fuel/tank[5]/level-gal_us");
		if(levelDropCentr == nil) { levelDropCentr = 0; }
		var wingtanks = getprop("sim/weight[4]/weight-lb") + getprop("sim/weight[6]/weight-lb");
		var centertank = getprop("sim/weight[5]/weight-lb");
		if (getprop("sim/freeze/fuel")) { return registerTimer(fuelTanks); }
		if (getprop("systems/refuel/contact")) {return registerTimer(fuelTanks); }
	
	# first zero all tanks
	foreach(f; fueltanks) {
			if (f.getNode("selected", 1).getBoolValue()){
				f.getNode("selected", 1).setBoolValue(0);
				}
			}
	# centreline	
	if (levelDropCentr > 0) {
		setprop("consumables/fuel/tank[5]/selected", 1);
	# wingtanks	
	} elsif (levelDropStbd > 0 and levelDropPort > 0) { 
		setprop("consumables/fuel/tank[4]/selected", 1);
		setprop("consumables/fuel/tank[6]/selected", 1); 
	# internal: not ordered yet
	} else {
			foreach(f; fueltanks) {
			if (f.getNode("level-lbs").getValue() > 0.01) {
				f.getNode("selected", 0).setBoolValue(1);
				} 
			}
		}
	} 
	settimer(fuelTanks, 0.3);
}

setlistener("/sim/signals/fdm-initialized", fuelTanks);