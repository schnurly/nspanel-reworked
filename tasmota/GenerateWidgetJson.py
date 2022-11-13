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

symbolLight = ""
symbolPowerPlug = ""
symbolPowerPlugOff = ""
symbolPower = ""
symbolLamp = ""
symbolFloorLamp = ""

widgetDefinition = {
    "sysPopup"  : {
            "components" : {    "1": ["3","buttonClose",componentTypeButton],
                                "2": ["9","txtIp",componentTypeText], 
                                "3": ["2","sliderDim",componentTypeSlider]       
            },
            "syscomponents" : { "1" : ["12","tTime",componentTypeText],
                                "2" : ["7","vaWifi",componentTypeIntVar] 
           }
    },
    "cardSolar" : {      
            "components" : {    "1": ["21","vaSolarPanel",componentTypeIntVar],
                                "2": ["20","vaBattery",componentTypeIntVar], 
                                "3": ["55","vaHouse",componentTypeIntVar],  
                                "4": ["19","vaGrid",componentTypeIntVar],
                                "5": ["26","vaBatteryChaS",componentTypeIntVar],                   
                                "6": ["29","mSys",componentTypeHotspot], 
                                "7": ["10","mRight",componentTypeHotspot],
                                "8": ["49","mleft",componentTypeHotspot]        
           },
           "syscomponents" : {  "1" : ["61","tTime",componentTypeText],
                                "2" : ["63","vaWifi",componentTypeIntVar],
                                "3": ["47","txtNoData",componentTypeText],
                                "4": ["59","vaNoData",componentTypeIntVar]
                            }
            },
    "cardWindow" :
    {      
       "components" : { "1": ["19","mSys",componentTypeHotspot], 
                        "2": ["47","mRight",componentTypeHotspot],
                        "3": ["42","mleft",componentTypeHotspot], 
                        "4": ["23","p1",componentTypePic],
                        "5": ["22","txtWindow1",componentTypeText],
                        "6": ["24","p2",componentTypePic],
                        "7": ["25","t0",componentTypeText],  
                        "8": ["26","p3",componentTypePic],
                        "9": ["27","t1",componentTypeText],  
                        "10": ["28","p4",componentTypePic],
                        "11": ["29","t2",componentTypeText],  
                        "12": ["30","p5",componentTypePic],
                        "13": ["31","t3",componentTypeText],  
                        "14": ["32","p6",componentTypePic],
                        "15": ["41","t8",componentTypeText],  
                        "16": ["33","p7",componentTypePic],
                        "17": ["40","t7",componentTypeText],  
                        "18": ["34","p8",componentTypePic],
                        "19": ["39","t6",componentTypeText],  
                        "20": ["35","p9",componentTypePic],
                        "21": ["38","t5",componentTypeText],
                        "22": ["36","p10",componentTypePic],
                        "23": ["37","t4",componentTypeText]
                      },
        "syscomponents" : { "1" : ["45","tTime",componentTypeText],
                            "2" : ["46","vaWifi",componentTypeIntVar]
                    }
    },
    "cardGrid" :
    {      
       "components" : {                  
                        "1": ["38","mSys",componentTypeHotspot], 
                        "2": ["36","mRight",componentTypeHotspot],
                        "3": ["39","mleft",componentTypeHotspot], 
                        "4": ["20","bEntity1",componentTypeButton],
                        "5": ["3","tEntity1",componentTypeText], 
                        "6": ["21","bEntity2",componentTypeButton],  
                        "7": ["22","tEntity2",componentTypeText],
                        "8": ["23","bEntity3",componentTypeButton],
                        "9": ["24","tEntity3",componentTypeText], 
                        "10": ["25","bEntity4",componentTypeButton],
                        "11": ["26","tEntity4",componentTypeText],   
                        "12": ["28","bEntity5",componentTypeButton],
                        "13": ["27","tEntity5",componentTypeText],   
                        "14": ["29","bEntity6",componentTypeButton],
                        "15": ["30","tEntity6",componentTypeText]           
                      },
        "syscomponents" : { "1" : ["41","tTime",componentTypeText],
                            "2" : ["43","vaWifi",componentTypeIntVar]
                    }
    }       
}


widget = {
    "0" :{
        "page" : "sysPopup",
        "backNav" : "",
        "components" : {
            "1" :{"visible" : "true","action":actionUsebackNav,"value" : "1"},
            "2" :{"visible" : "true","value" :"0"},
            "3" :{"visible" : "true","value" :"0"}
        }
    },    
    "1": { 
        "page" : "cardSolar",
        "components": { 
           "1": {"visible" : "true","mqttMappingName" : "powerSolar","value" :"0"},
           "2": {"visible" : "true","mqttMappingName" : "powerBattery","value" :"0"},
           "3": {"visible" : "true","mqttMappingName" : "powerHouse","value" :"0"},
           "4": {"visible" : "true","mqttMappingName" : "powerGrid","value" :"0"},
           "5": {"visible" : "true","mqttMappingName" : "batteryChargeState","value" :"0"},                        
           "6": { "action" : actionShowPopup,"value" : "0"},
           "7": { "action" : actionShowPage,"value" : "2"},
           "8": { "action" : actionShowPage,"value" : "3"}
        }         
    },
    "2": {
        "page" : "cardWindow",
        "components": { 
           "1": { "action" : actionShowPopup,"value" : "0"},
           "2": { "action" : actionShowPage, "value" : "3"},
           "3": { "action" : actionShowPage, "value" : "1"},
           "4": {"visible" : "true","mqttMappingName" : "T_WindowSleepingRoom_IsOpen","value" :"30","mqttValueMapping":{"OPEN":"31","CLOSED":"30"}},
           "5": {"visible" : "true","value" :"Schlafzimmer"},
           "6": {"visible" : "true","mqttMappingName" : "T_WindowChild1Room_IsOpen","value" :"30","mqttValueMapping":{"OPEN":"31","CLOSED":"30"}},
           "7": {"visible" : "true","value" :"Anja"}, 
           "8": {"visible" : "true","mqttMappingName" : "T_WindowChild2Room_IsOpen","value" :"30","mqttValueMapping":{"OPEN":"31","CLOSED":"30"}},
           "9": {"visible" : "true","value" :"Benjamin"},   
           "10": {"visible" : "true","mqttMappingName" : "T_WindowBath_IsOpen","value" :"30","mqttValueMapping":{"OPEN":"31","CLOSED":"30"}},
           "11": {"visible" : "true","value" :"Bad"},   
           "12": {"visible" : "true","mqttMappingName" : "T_WindowKitchen_IsOpen","value" :"30","mqttValueMapping":{"OPEN":"31","CLOSED":"30"}},
           "13": {"visible" : "true","value" :"Kueche"},   
           "14": {"visible" : "true","mqttMappingName" : "T_WindowWC_IsOpen","value" :"30","mqttValueMapping":{"OPEN":"31","CLOSED":"30"}},
           "15": {"visible" : "true","value" :"Klo"},   
           "16": {"visible" : "true","mqttMappingName" : "T_WindowLivingRoom_IsOpen","value" :"30","mqttValueMapping":{"OPEN":"31","CLOSED":"30"}}, 
           "17": {"visible" : "true","value" :"Terrasse"},   
           "18": {"visible" : "true","mqttMappingName" : "T_WindowDummy_IsOpen","value" :"30","mqttValueMapping":{"OPEN":"31","CLOSED":"30"}},
           "19": {"visible" : "true","value" :"Haustuer"},   
           "20": {"visible" : "true","mqttMappingName" : "T_WindowHobbyRoom1_IsOpen","value" :"30","mqttValueMapping":{"OPEN":"31","CLOSED":"30"}},
           "21": {"visible" : "true","value" :"HobbyR"},   
           "22": {"visible" : "true","mqttMappingName" : "T_WindowHobbyRoom2_IsOpen","value" :"30","mqttValueMapping":{"OPEN":"31","CLOSED":"30"}},
           "23": {"visible" : "true","value" :"HobbyL"}       
        }         
    },  
    "3": { 
        "page" : "cardGrid",
        "components": {                      
           "1": { "action" : actionShowPopup,"value" : "0"},
           "2": { "action" : actionShowPage,"value" : "1"},
           "3": { "action" : actionShowPage,"value" : "2"},
           "4": {"action":actionRaiseEvent, "visible":"true","value":"0","mqttMappingName" : "Power_Light_Tisch","mqttValueMapping":{"ON":"1","OFF":"0"},"text":symbolLight,"valueBasedColor":{"1":"65504","0":"65535"}},   
           "5": {"visible" : "true","value" :"Esstisch"},  
           "6": {"action":actionRaiseEvent, "visible":"true","value":"0","mqttMappingName" : "Power_Light_Ecke","mqttValueMapping":{"ON":"1","OFF":"0"},"text":symbolFloorLamp,"valueBasedColor":{"1":"65504","0":"65535"}},   
           "7": {"visible" : "true","value" :"Ecke"},
           "8": {"action":actionRaiseEvent, "visible":"true","value":"0","mqttMappingName" : "Power_Light_Couch","mqttValueMapping":{"ON":"1","OFF":"0"},"text":symbolFloorLamp,"valueBasedColor":{"1":"65504","0":"65535"}},   
           "9": {"visible" : "true","value" :"Couch"},
           "10": {"action":actionRaiseEvent, "visible":"true","value":"0","mqttMappingName" : "Power_Light_Wall","mqttValueMapping":{"ON":"1","OFF":"0"},"text":symbolLight,"valueBasedColor":{"1":"65504","0":"65535"}},   
           "11": {"visible" : "true","value" :"Wand"},
           "12": {"action":actionRaiseEvent, "visible":"true","value":"0","mqttMappingName" : "Power_TV_Plug","mqttValueMapping":{"ON":"1","OFF":"0"},"valueBasedText":{"1":symbolPowerPlug,0:symbolPowerPlugOff}},   
           "13": {"visible" : "true","value" :"TV"}, 
           "14": { "action":actionRaiseEvent, "visible":"true","value":"0","mqttMappingName" : "PowerOffAllWohnzimmer","text":symbolPower,"valueBasedColor":{"0":"43072"}},   
           "15": {"visible" : "true","value" :"Power OFF ALL"}
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

