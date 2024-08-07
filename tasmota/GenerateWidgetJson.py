componentTypeSys = 0
componentTypeText = 1
componentTypeButton = 2
componentTypeStateButton = 3
componentTypeIntVar = 4
componentTypeHotspot = 5
componentTypeSlider = 6
componentTypePic = 7

actionUsebackNav = 1 # for popup pages
actionShowPopup = 2
actionShowPage = 3
actionRaiseEvent = 4

symbolLightBulb = ""
symbolLightBulbOn = ""
symbolPowerPlug = ""
symbolPowerPlugOff = ""
symbolPower = ""
symbolLamp = ""
symbolFloorLamp = ""
symbolRobotVacuum = ""
symbolBroom = ""
symbolFlash = ""
symbolCloudQuestion = ""
symbolPause = ""
symbolHome = ""


widgetDefinition = {
    "sysPopup"  : {
            "components" : {    "1": ["Left","SwipeLeft",componentTypeSys],
                                "2": ["Up","SwipeUp",componentTypeSys],
                                "3": ["Right","SwipeRight",componentTypeSys],
                                "4": ["Down","SwipeDown",componentTypeSys],
                                "5": ["8","txtIp",componentTypeText], 
                                "6": ["2","sliderDim",componentTypeSlider]       
            },
            "syscomponents" : { "1" : ["11","tTime",componentTypeText],
                                "2" : ["5","vaWifi",componentTypeIntVar] 
           }
    },
    "cardSolar" : {      
            "components" : {    
                                "1": ["Left","SwipeLeft",componentTypeSys],
                                "2": ["Up","SwipeUp",componentTypeSys],
                                "3": ["Right","SwipeRight",componentTypeSys],
                                "4": ["Down","SwipeDown",componentTypeSys],
                                "5": ["19","vaSolarPanel",componentTypeIntVar],
                                "6": ["18","vaBattery",componentTypeIntVar], 
                                "7": ["51","vaHouse",componentTypeIntVar],  
                                "8": ["17","vaGrid",componentTypeIntVar],
                                "9": ["24","vaBatteryChaS",componentTypeIntVar]    
           },
           "syscomponents" : {  "1" : ["57","tTime",componentTypeText],
                                "2" : ["56","vaWifi",componentTypeIntVar],
                                "3": ["47","txtNoData",componentTypeText],
                                "4": ["55","vaNoData",componentTypeIntVar]
                            }
            },
    "cardWindow" :
    {      
       "components" : {
                        "1": ["Left","SwipeLeft",componentTypeSys],
                        "2": ["Up","SwipeUp",componentTypeSys],
                        "3": ["Right","SwipeRight",componentTypeSys],
                        "4": ["Down","SwipeDown",componentTypeSys],                      
                        "5": ["21","p1",componentTypePic],
                        "6": ["20","txtWindow1",componentTypeText],
                        "7": ["22","p2",componentTypePic],
                        "8": ["23","t0",componentTypeText],  
                        "9": ["24","p3",componentTypePic],
                        "10": ["25","t1",componentTypeText],  
                        "11": ["26","p4",componentTypePic],
                        "12": ["27","t2",componentTypeText],  
                        "13": ["28","p5",componentTypePic],
                        "14": ["29","t3",componentTypeText],  
                        "15": ["30","p6",componentTypePic],
                        "16": ["39","t8",componentTypeText],  
                        "17": ["31","p7",componentTypePic],
                        "18": ["38","t7",componentTypeText],  
                        "19": ["32","p8",componentTypePic],
                        "20": ["37","t6",componentTypeText],  
                        "21": ["33","p9",componentTypePic],
                        "22": ["36","t5",componentTypeText],
                        "23": ["34","p10",componentTypePic],
                        "24": ["35","t4",componentTypeText]
                      },
        "syscomponents" : { "1" : ["42","tTime",componentTypeText],
                            "2" : ["41","vaWifi",componentTypeIntVar]
                    }
    },
    "cardGrid" :
    {      
       "components" : {                  
                        "1": ["Left","SwipeLeft",componentTypeSys],
                        "2": ["Up","SwipeUp",componentTypeSys],
                        "3": ["Right","SwipeRight",componentTypeSys],
                        "4": ["Down","SwipeDown",componentTypeSys],
                        "5": ["19","bEntity1",componentTypeButton],
                        "6": ["3","tEntity1",componentTypeText], 
                        "7": ["20","bEntity2",componentTypeButton],  
                        "8": ["21","tEntity2",componentTypeText],
                        "9": ["22","bEntity3",componentTypeButton],
                        "10": ["23","tEntity3",componentTypeText], 
                        "11": ["24","bEntity4",componentTypeButton],
                        "12": ["25","tEntity4",componentTypeText],   
                        "13": ["27","bEntity5",componentTypeButton],
                        "14": ["26","tEntity5",componentTypeText],   
                        "15": ["28","bEntity6",componentTypeButton],
                        "16": ["29","tEntity6",componentTypeText],
                        "17": ["2","tHeading",componentTypeText]
                      },
        "syscomponents" : { "1" : ["37","tTime",componentTypeText],
                            "2" : ["36","vaWifi",componentTypeIntVar]
                    }
    },
    "popupVacuum" :
    {      
       "components" : {                  
                        "1": ["Left","SwipeLeft",componentTypeSys],
                        "2": ["Up","SwipeUp",componentTypeSys],
                        "3": ["Right","SwipeRight",componentTypeSys],
                        "4": ["Down","SwipeDown",componentTypeSys],
                        "5": ["2","tHeader",componentTypeText], 
                        "6": ["11","tStatusSymbol",componentTypeText],
                        "7": ["15","tStatusText",componentTypeText],
                        "8": ["8","bZone1",componentTypeButton],
                        "9": ["18","tZone1",componentTypeText], 
                        "10": ["16","bZone2",componentTypeButton],
                        "11": ["19","tZone2",componentTypeText],
                        "12": ["17","bZone3",componentTypeButton],
                        "13": ["20","tZone3",componentTypeText],
                        "14": ["12","bPause",componentTypeButton],
                        "15": ["13","bDock",componentTypeButton]
                     
                      },
        "syscomponents" : { "1" : ["6","tTime",componentTypeText],
                            "2" : ["3","vaWifi",componentTypeIntVar]
                    }
    },   
    "popupNotify" :
    {      
       "components" : {                  
                        "1": ["Left","SwipeLeft",componentTypeSys],
                        "2": ["Up","SwipeUp",componentTypeSys],
                        "3": ["Right","SwipeRight",componentTypeSys],
                        "4": ["Down","SwipeDown",componentTypeSys],
                        "5": ["4","tHeading",componentTypeText], 
                        "6": ["5","tText",componentTypeText],
                        "7": ["16","b0",componentTypeButton]                
                      },
        "syscomponents" : { "1" : ["10","tTime",componentTypeText],
                            "2" : ["9","vaWifi",componentTypeIntVar]
                    }
    }    
}


widget = {
    "0" :{
        "page" : "sysPopup",
        "backNav" : "",
        "components" : {
            "1" :{"value" : ""},
            "2" :{"action":actionUsebackNav,"value" : "1"},
            "3" :{"value" : ""},
            "4" :{"value" : ""},
            "5" :{"visible" : "true","value" :"0"},
            "6" :{"visible" : "true","value" :"0"}
        }
    },    
    "p1" :{
        "page" : "popupNotify",
        "backNav" : "",
        "components" : {
            "1" :{"value" : ""},
            "2" :{"action":actionUsebackNav,"value" : "1"},
            "3" :{"value" : ""},
            "4" :{"value" : ""},
            "5" :{"visible" : "true","value" :""},
            "6" :{"visible" : "true","value" :""},
            "7" :{"visible" : "false","value" :"0"}
        }
    },    
    "1": { 
        "page" : "cardSolar",
        "components": { 
           "1": {"action" : actionShowPage,"value" : "2"},
           "2": {"value" : ""},
           "3": {"action" : actionShowPage,"value" : "4"},
           "4": {"action" : actionShowPopup,"value" : "0"},
           "5": {"visible" : "true","mqttMappingName" : "powerSolar","value" :"0"},
           "6": {"visible" : "true","mqttMappingName" : "powerBattery","value" :"0"},
           "7": {"visible" : "true","mqttMappingName" : "powerHouse","value" :"0"},
           "8": {"visible" : "true","mqttMappingName" : "powerGrid","value" :"0"},
           "9": {"visible" : "true","mqttMappingName" : "batteryChargeState","value" :"0"},                        
          
        }         
    },
    "2": {
        "page" : "cardWindow",
        "components": { 
           "1": {"action" : actionShowPage,"value" : "3"},
           "2": {"value" : ""},
           "3": {"action" : actionShowPage,"value" : "1"},
           "4": {"action" : actionShowPopup,"value" : "0"},    
           "5": {"visible" : "true","mqttMappingName" : "T_WindowSleepingRoom_IsOpen","value" :"30","mqttValueMapping":{"OPEN":"31","CLOSED":"30"}},
           "6": {"visible" : "true","value" :"Schlafzimmer"},
           "7": {"visible" : "true","mqttMappingName" : "T_WindowChild1Room_IsOpen","value" :"30","mqttValueMapping":{"OPEN":"31","CLOSED":"30"}},
           "8": {"visible" : "true","value" :"Anja"}, 
           "9": {"visible" : "true","mqttMappingName" : "T_WindowChild2Room_IsOpen","value" :"30","mqttValueMapping":{"OPEN":"31","CLOSED":"30"}},
           "10": {"visible" : "true","value" :"Benjamin"},   
           "11": {"visible" : "true","mqttMappingName" : "T_WindowBath_IsOpen","value" :"30","mqttValueMapping":{"OPEN":"31","CLOSED":"30"}},
           "12": {"visible" : "true","value" :"Bad"},   
           "13": {"visible" : "true","mqttMappingName" : "T_WindowKitchen_IsOpen","value" :"30","mqttValueMapping":{"OPEN":"31","CLOSED":"30"}},
           "14": {"visible" : "true","value" :"Kueche"},   
           "15": {"visible" : "true","mqttMappingName" : "T_WindowWC_IsOpen","value" :"30","mqttValueMapping":{"OPEN":"31","CLOSED":"30"}},
           "16": {"visible" : "true","value" :"Klo"},   
           "17": {"visible" : "true","mqttMappingName" : "T_WindowLivingRoom_IsOpen","value" :"30","mqttValueMapping":{"OPEN":"31","CLOSED":"30"}}, 
           "18": {"visible" : "true","value" :"Terrasse"},   
           "19": {"visible" : "true","mqttMappingName" : "T_WindowDummy_IsOpen","value" :"30","mqttValueMapping":{"OPEN":"31","CLOSED":"30"}},
           "20": {"visible" : "true","value" :"Haustuer"},   
           "21": {"visible" : "true","mqttMappingName" : "T_WindowHobbyRoom1_IsOpen","value" :"30","mqttValueMapping":{"OPEN":"31","CLOSED":"30"}},
           "22": {"visible" : "true","value" :"HobbyR"},   
           "23": {"visible" : "true","mqttMappingName" : "T_WindowHobbyRoom2_IsOpen","value" :"30","mqttValueMapping":{"OPEN":"31","CLOSED":"30"}},
           "24": {"visible" : "true","value" :"HobbyL"}       
        }         
    },  
    "3": { 
        "page" : "cardGrid",
        "components": {      
           "1": {"action" : actionShowPage,"value" : "4"},
           "2": {"action" : actionShowPage,"value" : "3.1"},
           "3": {"action" : actionShowPage,"value" : "2"},
           "4": {"action" : actionShowPopup,"value" : "0"},    
           "5": {"action":actionRaiseEvent, "visible":"true","value":"0","mqttMappingName" : "Power_Light_Tisch","mqttValueMapping":{"ON":"1","OFF":"0"},"valueBasedText":{"1":symbolLightBulbOn,0:symbolLightBulb},"valueBasedColor":{"1":"65504","0":"65535"}},   
           "6": {"visible" : "true","value" :"Esstisch"},  
           "7": {"action":actionRaiseEvent, "visible":"true","value":"0","mqttMappingName" : "Power_Light_Ecke","mqttValueMapping":{"ON":"1","OFF":"0"},"text":symbolFloorLamp,"valueBasedColor":{"1":"65504","0":"65535"}},   
           "8": {"visible" : "true","value" :"Ecke"},
           "9": {"action":actionRaiseEvent, "visible":"true","value":"0","mqttMappingName" : "Power_Light_Couch","mqttValueMapping":{"ON":"1","OFF":"0"},"text":symbolFloorLamp,"valueBasedColor":{"1":"65504","0":"65535"}},   
           "10": {"visible" : "true","value" :"Couch"},
           "11": {"action":actionRaiseEvent, "visible":"true","value":"0","mqttMappingName" : "Power_Light_Wall","mqttValueMapping":{"ON":"1","OFF":"0"},"valueBasedText":{"1":symbolLightBulbOn,0:symbolLightBulb},"valueBasedColor":{"1":"65504","0":"65535"}},   
           "12": {"visible" : "true","value" :"Wand"},
           "13": {"action":actionRaiseEvent, "visible":"true","value":"0","mqttMappingName" : "Power_TV_Plug","mqttValueMapping":{"ON":"1","OFF":"0"},"valueBasedText":{"1":symbolPowerPlug,0:symbolPowerPlugOff}},   
           "14": {"visible" : "true","value" :"TV"}, 
           "15": { "action":actionRaiseEvent, "visible":"true","value":"0","mqttMappingName" : "PowerOffAllWohnzimmer","text":symbolPower,"valueBasedColor":{"0":"43072"}},   
           "16": {"visible" : "true","value" :"Alles Aus"},
           "17": {"visible" : "true","value" :"Wohnzimmer"}
        }         
        
    }, 
    "3.1": { 
        "page" : "cardGrid",
        "components": {      
           "1": {"action" : actionShowPage,"value" : "4"},
           "2": {"action" : actionShowPage,"value" : "3.2"},
           "3": {"action" : actionShowPage,"value" : "2"},
           "4": {"action" : actionShowPage,"value" : "3"},    
           "5": {"action":actionRaiseEvent, "visible":"true","value":"0","mqttMappingName" : "Power_Light_Anja","mqttValueMapping":{"ON":"1","OFF":"0"},"valueBasedText":{"1":symbolLightBulbOn,"0":symbolLightBulb},"valueBasedColor":{"1":"65504","0":"65535"}},   
           "6": {"visible" : "true","value" :"Anja"},  
           "7": {"action":actionRaiseEvent, "visible":"true","value":"0","mqttMappingName" : "Power_Light_Benjamin","mqttValueMapping":{"ON":"1","OFF":"0"},"valueBasedText":{"1":symbolLightBulbOn,"0":symbolLightBulb},"valueBasedColor":{"1":"65504","0":"65535"}},   
           "8": {"visible" : "true","value" :"Benjamin"},
           "9": {"action":actionRaiseEvent, "visible":"true","value":"0","mqttMappingName" : "Power_Light_FlurOG","mqttValueMapping":{"ON":"1","OFF":"0"},"valueBasedText":{"1":symbolLightBulbOn,"0":symbolLightBulb},"valueBasedColor":{"1":"65504","0":"65535"}},   
           "10": {"visible" : "true","value" :"Flur"},
           "11": {"visible" : "false","value" :""},   
           "12": {"visible" : "false","value" :""},
           "13": {"visible" : "false","value" :""},   
           "14": {"visible" : "false","value" :""}, 
           "15": { "visible" : "false","value" :""},   
           "16": {"visible" : "false","value" :""},
           "17": {"visible" : "true","value" :"Obergeschoss"}
        }                 
    },  
     "3.2": { 
        "page" : "cardGrid",
        "components": {      
           "1": {"action" : actionShowPage,"value" : "4"},
           "2": {"action" : actionShowPage,"value" : "3"},
           "3": {"action" : actionShowPage,"value" : "2"},
           "4": {"action" : actionShowPage,"value" : "3.1"},    
           "5": {"action":actionRaiseEvent, "visible":"true","value":"0","mqttMappingName" : "Power_Light_Hobbyraum","mqttValueMapping":{"ON":"1","OFF":"0"},"valueBasedText":{"1":symbolLightBulbOn,"0":symbolLightBulb},"valueBasedColor":{"1":"65504","0":"65535"}},   
           "6": {"visible" : "true","value" :"Hobbyraum"},  
           "7": {"action":actionRaiseEvent, "visible":"true","value":"0","mqttMappingName" : "Power_Light_HobbyraumLED","mqttValueMapping":{"ON":"1","OFF":"0"},"valueBasedText":{"1":symbolLightBulbOn,"0":symbolLightBulb},"valueBasedColor":{"1":"65504","0":"65535"}},   
           "8": {"visible" : "true","value" :"Hobbyraum LED"},
           "9": {"action":actionRaiseEvent, "visible":"true","value":"0","mqttMappingName" : "Power_Light_FlurKG","mqttValueMapping":{"ON":"1","OFF":"0"},"valueBasedText":{"1":symbolLightBulbOn,"0":symbolLightBulb},"valueBasedColor":{"1":"65504","0":"65535"}},   
           "10": {"visible" : "true","value" :"Flur"},
           "11": {"visible" : "false","value" :""},   
           "12": {"visible" : "false","value" :""},
           "13": {"visible" : "false","value" :""},   
           "14": {"visible" : "false","value" :""}, 
           "15": { "visible" : "false","value" :""},   
           "16": {"visible" : "false","value" :""},
           "17": {"visible" : "true","value" :"Keller"}
        }                 
    },      
    "4": { 
        "page" : "cardGrid",
        "components": {      
           "1": {"action" : actionShowPage,"value" : "1"},
           "2": {"value" : ""},
           "3": {"action" : actionShowPage,"value" : "3"},
           "4": {"action" : actionShowPopup,"value" : "0"},                
           "5": {"action":actionShowPopup, "visible":"true","value":"pDobby","valueBasedColor":{"pDobby":"1304"},"text":symbolRobotVacuum},   
           "6": {"visible" : "true","value" :"Dobby"},  
           "7": {"visible" : "false","value" :""}, 
           "8": {"visible" : "false","value" :""},
           "9": {"action":actionShowPopup, "visible":"true","value":"pWinky","valueBasedColor":{"pWinky":"1304"},"text":symbolRobotVacuum},   
           "10": {"visible" : "true","value" :"Winky"},
           "11": {"visible" : "false","value" :""},   
           "12": {"visible" : "false","value" :""},
           "13": {"visible" : "false","value" :""},   
           "14": {"visible" : "false","value" :""}, 
           "15": { "visible" : "false","value" :""},   
           "16": {"visible" : "false","value" :""},
           "17": {"visible" : "true","value" :"Staubsauger"}
        }                 
    },     
    "pDobby": { 
        "page" : "popupVacuum",
        "backNav" : "",
        "components": {  
           "1": { "action" : actionShowPage,"value" : "2"},
           "2": { "action" : actionUsebackNav,"value" : "0"},
           "3": { "action" : actionShowPage,"value" : "4"},
           "4": {"value" : ""},           
           "5": {"visible" : "true","value" :"Dobby"},  
           "6": {"visible" : "true","value" :"Offline","mqttMappingName" : "Dobby_Status_Symbol", "valueBasedText":{"Returning":symbolHome,"Pause":symbolPause,"Charging":symbolFlash,"Cleaning":symbolBroom,"Offline":symbolCloudQuestion}},
           "7": {"visible" : "true","value" :"","mqttMappingName" : "Dobby_Status_Text"},   
           "8": {"visible" : "true","action":actionRaiseEvent,"mqttMappingName" : "Dobby_Clean_Alles","value" :""}, 
           "9": {"visible" : "true","value" :"Alles"},   
           "10": {"visible" : "true","action":actionRaiseEvent,"mqttMappingName" : "Dobby_Clean_Flur","value" :""}, 
           "11": {"visible" : "true","value" :"Flur"},   
           "12": {"visible" : "false","value" :""}, 
           "13": {"visible" : "false","value" :""},   
           "14": {"visible" : "true","action":actionRaiseEvent,"mqttMappingName" : "Dobby_Clean_Pause","value" :""}, 
           "15": {"visible" : "true","action":actionRaiseEvent,"mqttMappingName" : "Dobby_Clean_Dock","value" :""}   
           
    
        }                 
    },
    "pWinky": { 
        "page" : "popupVacuum",
        "backNav" : "",
        "components": {          
           "1": { "action" : actionShowPage,"value" : "2"},
           "2": { "action" : actionUsebackNav,"value" : "0"},
           "3": { "action" : actionShowPage,"value" : "4"},
           "4": {"value" : ""},        
           "5": {"visible" : "true","value" :"Winky"},  
           "6": {"visible" : "true","value" :"Offline","mqttMappingName" : "Winky_Status_Symbol", "valueBasedText":{"Returning":symbolHome,"Pause":symbolPause,"Charging":symbolFlash,"Cleaning":symbolBroom,"Offline":symbolCloudQuestion}},
           "7": {"visible" : "true","value" :"","mqttMappingName" : "Winky_Status_Text"},   
           "8": {"visible" : "true","action":actionRaiseEvent,"mqttMappingName" : "Winky_Clean_Alles","value" :""}, 
           "9": {"visible" : "true","value" :"Alles"},   
           "10": {"visible" : "false","value" :""}, 
           "11": {"visible" : "false","value" :""},   
           "12": {"visible" : "false","value" :""}, 
           "13": {"visible" : "false","value" :""},   
           "14": {"visible" : "true","action":actionRaiseEvent,"mqttMappingName" : "Winky_Clean_Pause","value" :""}, 
           "15": {"visible" : "true","action":actionRaiseEvent,"mqttMappingName" : "Winky_Clean_Dock","value" :""}                  
        }                 
    }
 }

#{
#  "1": ["pageName",backNav,[[elmentId,"elementName",elementType,isVisible,value,action,mqttMappingName,{"OPEN":"31","CLOSED":"30"}]],[[]],text,valueBasedColor]
#{

result = {}
for pageId in widget:
    newPage = []
    pageInstance = widget[pageId]
    pageName = widget[pageId]["page"]
    pageDef = widgetDefinition[pageName]
    newPage.append(pageInstance["page"])
    backNav = ''
    if "backNav" in pageInstance:
        backNav = pageInstance["backNav"] 
    newPage.append(backNav)
    
    components = []
    for compIndex in pageInstance["components"]:
       comp = pageInstance["components"][compIndex]
       compDef = pageDef["components"][compIndex]
       att=[]
       for i in range(0,3):
         att.append(compDef[i])
       
       visible = ''
       if "visible" in comp:
         visible =  1 if comp["visible" ] == "true"  else 0    
       att.append(visible)
       value = ''
       if "value" in comp:
         value = comp["value" ]
       att.append(value)
       action = ''
       if "action" in comp:
         action = comp["action"]
       att.append(action)
       mqttMappingName = ''
       if "mqttMappingName" in comp:
         mqttMappingName = comp["mqttMappingName"]
       att.append(mqttMappingName)
       mqttValueMapping = ''
       if "mqttValueMapping" in comp:
         mqttValueMapping = comp["mqttValueMapping"]
       att.append(mqttValueMapping)
       text = ''
       if "text" in comp:
         print("sign:" + comp["text"])
         text = comp["text"]
       att.append(text)
       valueBasedColor = ''
       if "valueBasedColor" in comp:
         valueBasedColor = comp["valueBasedColor"]
       att.append(valueBasedColor)
       valueBasedText = ''
       if "valueBasedText" in comp:
         valueBasedText = comp["valueBasedText"]
       att.append(valueBasedText)
       ####
       components.append(att)       
    newPage.append(components)
    components = []
    for compIndex in pageDef["syscomponents"]:
       compDef = pageDef["syscomponents"][compIndex]
       att=[]
       for i in range(0,3):
         att.append(compDef[i])
       components.append(att)
    newPage.append(components)
    result[pageId]=newPage
    
print(result)
import json
with open("widget.json", 'wb') as f:
    data = json.dumps(result,ensure_ascii=False).encode('utf8')
    f.write(data)

