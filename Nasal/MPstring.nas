var in_loads = 0;

var loads = func(loads){
        if(loads){
                in_loads = 1;
                print("ready to extract");
                extractloads();
        }else{
                in_loads = 0;
        }
}

var makestring = func {

        var thestring = "";
        thestring = thestring ~ "load#" ;
        var loads = props.globals.getNode("sim").getChildren();

        foreach( var load; loads) {
                var type = load.getName();
                
                if(type == "weight"){
                        var index = load.getIndex();
                        
                        #var selected = load.getNode("selected");
                        var selected = getprop("sim/weight[" ~ index ~ "]/selected");
                        
                        #var thesize = size(selected) + 10 ; # +10 is to be sure that the sting f the length will be codded on 2 caracters
                        var isreleased = getprop("controls/armament/station["~ index ~"]/release");
                        
                        thestring = thestring ~ index ~ isreleased ~ selected ~ "#";
                        #print(index);
                        #print(selected);
                        #print(thesize);
                        #print(isreleased);
                        #print(thestring);
                }
                
        }
        print(substr(thestring,0,searchString('#',thestring)));
        
        #var count = countSearched('#',thestring);
        #print("count : "~ count);
        #var exctrat = thestring;
        
        #for(var i = 0;i<count;i+=1){
        #                if(searchString('#',exctrat) != nil){
        #                        if(searchString('#',exctrat) +1 < size(exctrat)) {
        #                                exctrat = substr(exctrat,searchString('#',exctrat)+1);
        #                                exctrated = substr(exctrat,0,searchString('#',exctrat));
        #                                var exctratedpylon = substr(exctrated,0,1);
        #                                var exctratedisreleased = substr(exctrated,1,1);
        #                                var exctratedSelected = substr(exctrated,2);
        #                        
        #                        
        #                                print(exctrated);                        
        #                                print(exctratedpylon); 
        #                                print(exctratedisreleased);
        #                                print(exctratedSelected); 
        #                        }

        #                }
        #}    
        
        #print("count : "~ count);
        
        #var test1 = substr(thestring,searchString('#',thestring)+1); 
        #var test2 = substr(test1,0,searchString('#',test1));
        #print("test1 : " ~ test2);
        
        #test1 = substr(test1,searchString('#',test1)+1); 
        #test3 = substr(test1,0,searchString('#',test1));
        
        #print("test2 : " ~ test3);
        
        
        setprop("/sim/multiplay/generic/string[0]",thestring);
        print(thestring);
        
        
       settimer(extractloads, 0.25);
}

var extractloads = func() {

        if(in_loads){
                #var thevariable =  getprop("/sim/multiplay/generic/string[0]");
                
                var self = cmdarg();
                var thevariable = self.getNode("/sim/multiplay/generic/string[0]", 1);
                thevariable = thevariable.getValue();

                #print(thevariable);
                
                if(thevariable != nil and size(thevariable)>3){
                        var type = substr(thevariable,0,4);
                        
                        if (type =="load") {
                        
                                var extractload = substr(thevariable,4);
                                
                                #var pylon = substr(extractload,0,1);
                                #var release = substr(extractload,1,2);
                                #searchString("#",extractload);
                                
                                
                                var count = countSearched('#',thevariable);
                                print("count : "~ count);
                                var exctrat = thevariable;
                                
                                for(var i = 0;i<count;i+=1){
                                    if(searchString('#',exctrat) != nil){
                                          if(searchString('#',exctrat) +1 < size(exctrat)) {
                                               exctrat = substr(exctrat,searchString('#',exctrat)+1);
                                               exctrated = substr(exctrat,0,searchString('#',exctrat));
                                               var exctratedpylon = substr(exctrated,0,1);
                                               var exctratedisreleased = substr(exctrated,1,1);
                                               var exctratedSelected = substr(exctrated,2);
                                       
                                       
                                               print(exctrated);       
                                               print(exctratedpylon); 
                                               print(exctratedisreleased);
                                               print(exctratedSelected); 
                                               
                                               #self.getNode("controls/armament/station["~ exctratedpylon ~"]/release", 1).setValue(exctratedisreleased);
                                               #setprop("controls/armament/station["~ exctratedpylon ~"]/release", exctratedisreleased);
                                               
                                               #self.getNode("sim/weight[" ~ exctratedpylon ~ "]/selected", 1).setValue(exctratedSelected);
                                               #setprop("sim/weight[" ~ exctratedpylon ~ "]/selected",exctratedSelected);
                                               
                                               
                                           }

                                      }
                                }  


                        }
                
                }
                settimer(extractloads, 0.25);
        }
}
var searchString = func(carac, thestring){
       for(var i = 0;i<size(thestring);i=i+1){
                var test = thestring[i];
                #print(i);
                #print("Pouet" ~ test);
               if(test == carac[0]){
                       return i;
               }
       }
}

var countSearched = func(carac, thestring){
        var count = 0;
        for(var i = 0;i<size(thestring);i+=1){
               if(thestring[i] == carac[0]){
                       count += 1;
               }
                
        }
        return count;
}
