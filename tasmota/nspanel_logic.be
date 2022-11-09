# Sonoff NSPanel Tasmota Lovelace UI Berry Driver | code by joBr99
# based on;
# Sonoff NSPanel Tasmota (Nextion with Flashing) driver | code by peepshow-21
# based on;
# Sonoff NSPanel Tasmota driver v0.47 | code by blakadder and s-hadinger

# Example Flash
# FlashNextion http://ip-address-of-your-homeassistant:8123/local/nspanel.tft
# FlashNextion http://nspanel.pky.eu/lui.tft

var debug = true

var mqtttopic = "tele/tasmota_C851C0" 
var mqtttopiccmnd = "cmnd/tasmota_C851C0" 
# wenn bei publish_result der subtopic funktionieren sollte kann das hier entfernt werden, 
# ansonsten geht mir auch die info ab wie und ob der TOPIC in einer Globalenvariable versteckt ist, doku ist nichts zu findne.

var componentTypeText = "Typetext"
var componentTypeButton = "Typebutton"
var componentTypeStateButton = "Typestatebutton"
var componentTypeIntVar = "Typeintvar"
var componentTypeHotspot = "Typehotspot"
var componentTypeSlider = "Typeslider"
var componentTypePic = "Typepic"

var widgetDefinition = {
    "sysPopup"  : {
           "components" : { "1": ["3","buttonClose",componentTypeButton],
                            "2": ["9","txtIp",componentTypeText], 
                            "3": ["2","sliderDim",componentTypeSlider]       
      },
           "syscomponents" : { "1" : ["12","tTime",componentTypeText],
                               "2" : ["7","vaWifi",componentTypeIntVar] 
         }
    },
    "cardSolar" :
    {      
       "components" : { "1": ["21","vaSolarPanel",componentTypeIntVar],
                        "2": ["20","vaBattery",componentTypeIntVar], 
                        "3": ["55","vaHouse",componentTypeIntVar],  
                        "4": ["19","vaGrid",componentTypeIntVar],
                        "5": ["26","vaBatteryChaS",componentTypeIntVar],                   
                        "6": ["29","mSys",componentTypeHotspot], 
                        "7": ["10","mRight",componentTypeHotspot],
                        "8": ["53","mleft",componentTypeHotspot],        
                      },
        "syscomponents" : { "1" : ["61","tTime",componentTypeText],
                            "2" : ["63","vaWifi",componentTypeIntVar],
                            "3": ["47","txtNoData",componentTypeText],
                            "4": ["59","vaNoData",componentTypeIntVar],
                    }
    },
    "cardWindow" :
    {      
       "components" : { "1": ["20","mSys",componentTypeHotspot], 
                        "2": ["18","mRight",componentTypeHotspot],
                        "3": ["43","mleft",componentTypeHotspot], 
                        "4": ["24","p1",componentTypePic],
                        "5": ["23","txtWindow1",componentTypeText],
                        "6": ["25","p2",componentTypePic],
                        "7": ["26","t0",componentTypeText],  
                        "8": ["27","p3",componentTypePic],
                        "9": ["28","t1",componentTypeText],  
                        "10": ["29","p4",componentTypePic],
                        "11": ["30","t2",componentTypeText],  
                        "12": ["31","p5",componentTypePic],
                        "13": ["32","t3",componentTypeText],  
                        "14": ["33","p6",componentTypePic],
                        "15": ["42","t8",componentTypeText],  
                        "16": ["34","p7",componentTypePic],
                        "17": ["41","t7",componentTypeText],  
                        "18": ["35","p8",componentTypePic],
                        "19": ["40","t6",componentTypeText],  
                        "20": ["36","p9",componentTypePic],
                        "21": ["39","t5",componentTypeText],
                        "22": ["37","p10",componentTypePic],
                        "23": ["38","t4",componentTypeText]
                      },
        "syscomponents" : { "1" : ["46","tTime",componentTypeText],
                            "2" : ["47","vaWifi",componentTypeIntVar]
                    }
    }       
}

var sysComponentStore = {}

var actionUsebackNav = "usebackNav" # for popup pages
var actionShowPopup = "showPopup"
var actionShowPage = "showPage"
var actionRaiseEvent = "raiseEvent"

var widget = {
   "0" : {"page" : "sysPopup",
          "backNav" : "",
          "components" : {
              "1" :{"visible" : "true","action":actionUsebackNav,"value" : "1"},
              "2" :{"visible" : "true","value" :"0"},
              "3" :{"visible" : "true","value" :"0"}
          }
   },
   "1": {  "page" : "cardSolar",
         "components": { 
            "1": {"visible" : "true","mqttMappingName" : "powerSolar","value" :"0"},
            "2": {"visible" : "true","mqttMappingName" : "powerBattery","value" :"0"},
            "3": {"visible" : "true","mqttMappingName" : "powerHouse","value" :"0"},
            "4": {"visible" : "true","mqttMappingName" : "powerGrid","value" :"0"},
            "5": {"visible" : "true","mqttMappingName" : "batteryChargeState","value" :"0"},                        
            "6": { "action" : actionShowPopup,"value" : "0"},
            "7": { "action" : actionShowPage,"value" : "2"},
            "8": { "value" : "0"}
         }         
     },
   "2": {  "page" : "cardWindow",
         "components": { 
            "1": { "action" : actionShowPopup,"value" : "0"},
            "2": { "value" : ""},
            "3": { "action" : actionShowPage, "value" : "1"},
            "4": {"visible" : "true","mqttMappingName" : "window1State","value" :"30","mqttValueMapping":{"OPEN":"31","CLOSED":"30"}},
            "5": {"visible" : "true","value" :"Schlafzimmer"},
            "6": {"visible" : "true","mqttMappingName" : "window1State","value" :"30","mqttValueMapping":{"OPEN":"31","CLOSED":"30"}},
            "7": {"visible" : "true","value" :"Anja"}, 
            "8": {"visible" : "true","mqttMappingName" : "window1State","value" :"30","mqttValueMapping":{"OPEN":"31","CLOSED":"30"}},
            "9": {"visible" : "true","value" :"Benjamin"},   
            "10": {"visible" : "true","mqttMappingName" : "window1State","value" :"30","mqttValueMapping":{"OPEN":"31","CLOSED":"30"}},
            "11": {"visible" : "true","value" :"Bad"},   
            "12": {"visible" : "true","mqttMappingName" : "window1State","value" :"30","mqttValueMapping":{"OPEN":"31","CLOSED":"30"}},
            "13": {"visible" : "true","value" :"Kueche"},   
            "14": {"visible" : "true","mqttMappingName" : "window1State","value" :"30","mqttValueMapping":{"OPEN":"31","CLOSED":"30"}},
            "15": {"visible" : "true","value" :"Klo"},   
            "16": {"visible" : "false","mqttMappingName" : "window1State","value" :"30","mqttValueMapping":{"OPEN":"31","CLOSED":"30"}},            "17": {"visible" : "false","value" :"Terrasse"},   
            "18": {"visible" : "false","mqttMappingName" : "window1State","value" :"30","mqttValueMapping":{"OPEN":"31","CLOSED":"30"}},
            "19": {"visible" : "false","value" :"Haustuer"},   
            "20": {"visible" : "false","mqttMappingName" : "window1State","value" :"30","mqttValueMapping":{"OPEN":"31","CLOSED":"30"}},
            "21": {"visible" : "false","value" :"HobbyR"},   
            "22": {"visible" : "false","mqttMappingName" : "window1State","value" :"30","mqttValueMapping":{"OPEN":"31","CLOSED":"30"}},
            "23": {"visible" : "false","value" :"HobbyL"}       
         }         
     }
}
var _currentPageId = "1"
var idleCount = 0

def dlog(message)
    if debug
        print(message)
    end
end


class Nextion : Driver

    static header = bytes('55BB')

    static flash_block_size = 4096

    var flash_mode
	var flash_start_millis
    var flash_size
    var flash_written
    var flash_buff
    var flash_offset
    var awaiting_offset
    var tcp
    var ser
    var last_per
	var url

    def set_power()
        import string
        var ps = tasmota.get_power()
        var cmd
        for i:0..1
          if ps[i] == true
            self.sendnx(string.format("pic %d,290,buttonOnPicId",i*240))
          else 
            self.sendnx(string.format("pic %d,290,buttonOffPicId",i*240))
          end
        end
     
      end  

    def split_55(b)
      var ret = []
      var s = size(b)   
      var i = s-2   # start from last-1
      while i > 0
        if b[i] == 0x55 && b[i+1] == 0xBB           
          ret.push(b[i..s-1]) # push last msg to list
          b = b[(0..i-1)]   # write the rest back to b
        end
        i -= 1
      end
      ret.push(b)
      return ret
    end

    def crc16(data, poly)
      if !poly  poly = 0xA001 end
      # CRC-16 MODBUS HASHING ALGORITHM
      var crc = 0xFFFF
      for i:0..size(data)-1
        crc = crc ^ data[i]
        for j:0..7
          if crc & 1
            crc = (crc >> 1) ^ poly
          else
            crc = crc >> 1
          end
        end
      end
      return crc
    end

	# encode using custom protocol 55 BB [payload length] [payload length] [payload] [crc] [crc]
    def encode(payload)
      var b = bytes()
      b += self.header
      b.add(size(payload), 2)   # add size as 2 bytes, little endian
      b += bytes().fromstring(payload)
      var msg_crc = self.crc16(b)
      b.add(msg_crc, 2)       # crc 2 bytes, little endian
      return b
    end

    def encodenx(payload)
        var b = bytes().fromstring(payload)
        b += bytes('FFFFFF')
        return b
    end

    def sendnx(payload)
        import string
        dlog("sendnx:"+payload)
        var payload_bin = self.encodenx(payload)
        self.ser.write(payload_bin)
        log(string.format("NXP: Nextion command sent = %s",str(payload_bin)), 3)       
    end



    def sendnxMulti(payloadArray)
        import string
        var payload_bin = bytes()
        for payload:payloadArray.iter()
            payload_bin += self.encodenx(payload)
        end
        self.ser.write(payload_bin)
        log(string.format("NXP: Nextion command sent = %s",str(payload_bin)), 3)       
    end

    def send(payload)
        var payload_bin = self.encode(payload)
        if self.flash_mode==1
            log("NXP: skipped command becuase still flashing", 3)
        else 
            self.ser.write(payload_bin)
            log("NXP: payload sent = " + str(payload_bin), 3)
        end
    end

    def write_to_nextion(b)
        self.ser.write(b)
    end

    def screeninit()
        log("NXP: Screen Initialized")
		#self.sendnx("recmod=1")		
    end

    def write_block()
        
        import string
        log("FLH: Read block",3)
        while size(self.flash_buff)<self.flash_block_size && self.tcp.connected()
            if self.tcp.available()>0
                self.flash_buff += self.tcp.readbytes()
            else
                tasmota.delay(50)
                log("FLH: Wait for available...",3)
            end
        end
        log("FLH: Buff size "+str(size(self.flash_buff)),3)
        var to_write
        if size(self.flash_buff)>self.flash_block_size
            to_write = self.flash_buff[0..self.flash_block_size-1]
            self.flash_buff = self.flash_buff[self.flash_block_size..]
        else
            to_write = self.flash_buff
            self.flash_buff = bytes()
        end
        log("FLH: Writing "+str(size(to_write)),3)
        var per = (self.flash_written*100)/self.flash_size
        if (self.last_per!=per) 
            self.last_per = per
            tasmota.publish_result(string.format("{\"Flashing\":{\"complete\": %d, \"time_elapsed\": %d}}",per , (tasmota.millis()-self.flash_start_millis)/1000), "RESULT") 
        end
        if size(to_write)>0
            self.flash_written += size(to_write)
            self.ser.write(to_write)
        end
        log("FLH: Total "+str(self.flash_written),3)
        if (self.flash_written==self.flash_size)
            log("FLH: Flashing complete - Time elapsed: %d", (tasmota.millis()-self.flash_start_millis)/1000)
            self.flash_mode = 0
			self.ser = nil
			tasmota.gc()
			self.ser = serial(17, 16, 115200, serial.SERIAL_8N1)
        end

    end
    
    def change_page(pageId)    
        import string 
        _currentPageId = pageId
        var pageToNav = widget[pageId]["page"]   
        self.sendnx(string.format("page %s",pageToNav))
        self.prepare_page(pageId)
        print("do_defined_work_4")
        tasmota.publish(mqtttopic + "/PAGEEVENT",string.format("{\"pageId\":\"%s\"}",pageId))  
    end

    def prepare_page(pageId)
        import string
        var cardName = widget[pageId]["page"]
        print("prepare_page_1:" + cardName)
        for id:widgetDefinition[cardName]["components"].keys()
            print("prepare_page_2:" + id)
            var isVisible = "0"
            if widget[pageId]["components"][id].contains("visible") 
                isVisible = widget[pageId]["components"][id]["visible"] == "true" ? "1" : "0"
            end
            var compType = widgetDefinition[cardName]["components"][id][2]
            var compTypeNameIndex = 1
            self.set_component_value(compType,widgetDefinition[cardName]["components"][id][compTypeNameIndex],widget[pageId]["components"][id]["value"])
            self.set_component_visibilty(compType,widgetDefinition[cardName]["components"][id][compTypeNameIndex],isVisible)       
        end
        for id:widgetDefinition[cardName]["syscomponents"].keys()
            if sysComponentStore.contains(widgetDefinition[cardName]["syscomponents"][id][1]) 
                self.set_component_value(widgetDefinition[cardName]["syscomponents"][id][2],widgetDefinition[cardName]["syscomponents"][id][1],sysComponentStore[widgetDefinition[cardName]["syscomponents"][id][1]] )
            end
        end    
        self.set_power()
    end    
    def set_component_visibilty(compType,compName,isVisible)
        import string
        if compType == componentTypeText                      
            self.sendnx(string.format("vis %s,%s",compName,isVisible))
        elif compType== componentTypeStateButton                      
            self.sendnx(string.format("vis %s,%s",compName,isVisible))           
        elif compType == componentTypePic            
            self.sendnx(string.format("vis %s,%s",compName,isVisible))            
        end
    end
    def set_component_value(compType,compName,compValue)
        import string
        if compType == componentTypeText       
            self.sendnx(string.format("%s.txt=\"%s\"",compName,compValue))          
        elif compType== componentTypeStateButton           
            self.sendnx(string.format("%s.val=\"%s\"",compName,compValue))            
        elif compType== componentTypeIntVar  
            self.sendnx(string.format("%s.val=%s",compName,compValue)   )                  
        elif compType == componentTypePic                        
            self.sendnx(string.format("%s.pic=%s",compName,compValue)   )
        end
    end


    def do_defined_work(componentId)
        import string
        var page = widget[_currentPageId]
        var componentIdIntern = "0"
        for id:widgetDefinition[page["page"]]["components"].keys()     
            if widgetDefinition[page["page"]]["components"][id][0] == componentId     
                componentIdIntern = id
                break
            end
        end
        if componentIdIntern != "0"
            var componentDefinition = widgetDefinition[page["page"]]["components"][componentIdIntern]
            var component = page["components"][componentIdIntern]
            print("do_defined_work_1:"+componentIdIntern)
            if componentDefinition[2] == componentTypeButton || componentDefinition[2] == componentTypeHotspot
                print("do_defined_work_2")
                if component.contains("action") && component["action"] != ""                
                    var action = component["action"] 
                    print("do action:"+action)
                    if action == actionShowPage
                        self.change_page(component["value"])
                    elif action == actionShowPopup
                        widget[component["value"]]["backNav"] = _currentPageId
                        _currentPageId = component["value"]
                        var pageToNav = widget[component["value"]]["page"]       
                        self.sendnx(string.format("page %s",pageToNav))
                        self.prepare_page(component["value"])    
                    elif action == actionUsebackNav
                        self.change_page(page["backNav"])
                    elif action == actionRaiseEvent
                        tasmota.publish(mqtttopic +"/BUTTONEVENT",string.format("{\"pageId\":\"%s\", \"component\":\"%s\",\"event\":\"buttonPressed\"}",_currentPageId,component["mqttMappingName"]))
                    end    
                end      
            end
         end
    end
        
    def update_component_mqtt(pageId,name,value)
        import string
        var compDef = widgetDefinition[widget[pageId]["page"]]["components"]
        var comp = widget[pageId]["components"]
        for id:comp.keys()      
            if comp[id].contains("mqttMappingName") && comp[id]["mqttMappingName"] == name        
                if comp[id].contains("mqttValueMapping") 
                    if comp[id]["mqttValueMapping"].contains(value)                     
                        value = comp[id]["mqttValueMapping"][value]                    
                    end
                end
                var compType = compDef[id][2]
                comp[id]["value"] = value     
                if _currentPageId == pageId
                    self.set_component_value(compType,compDef[id][1],value)               
                end
                break
            end
        end
    end
    #used driver internally
    def update_component(name,value)
        import string        
        var pageDef = widgetDefinition[widget[_currentPageId]["page"]]
        var compDef = pageDef["components"]
        for id:compDef.keys()
            if compDef[id][1] == name
                var compType = compDef[id][2]
                widget[_currentPageId]["components"][id]["value"] = value
                self.set_component_value(compType,name,value)              
            end
        end
    end

    def change_syscomponent_visibility(name,value)
        import string
        var pageName = widget[_currentPageId]["page"]
        var sysComp = widgetDefinition[pageName]["syscomponents"]
        for id:sysComp.keys()            
            if sysComp[id][1] == name    
                self.set_component_visibilty(sysComp[id][2],name,value)                          
            end
        end
    end

    def update_syscomponent(name,value)
        import string
        var pageName = widget[_currentPageId]["page"]
        var sysComp = widgetDefinition[pageName]["syscomponents"]
        for id:sysComp.keys()
            if sysComp[id][1] == name
                var type = sysComp[id][2]
                self.set_component_value(type,name,value)             
            end
        end
        if !sysComponentStore.contains(name)
            sysComponentStore.insert(name,value)
        else
            sysComponentStore[name] = value
        end
    end

    
    def interpret_mqtt_command(cmd, payload_json)
        var retVal = false
        if cmd == "UpdateContent" 
            idleCount=0             
            for comp : payload_json["components"]                         
                self.update_component_mqtt(payload_json["pageId"],comp[0],comp[1])  
            end  
            retVal = true          
        end    
        return retVal  
    end
     
    def set_clock()
        import string
        var now = tasmota.rtc()
        var time_raw = now['local']
        var nsp_time = tasmota.time_dump(time_raw)
        var time_payload = string.format("%02d:%02d",nsp_time['hour'],nsp_time['min'])
        self.update_syscomponent("tTime",time_payload)
    end

    def set_wifiStatus()
        var wifi = tasmota.wifi()
        var value 
        if wifi.contains("ip")  && wifi["ip"] == ""
            value = 0
        else
            value = wifi["quality"]        
            self.update_component("txtIp",wifi["ip"])            
        end
        self.update_syscomponent("vaWifi",str(value))
    end

    def set_no_data()
        if _currentPageId == 1 
            if idleCount == 0
                #self.change_syscomponent_visibility("txtNoData",0)
                self.update_syscomponent("vaNoData","0")
            elif idleCount == 4
                #self.change_syscomponent_visibility("txtNoData",1)
                self.update_syscomponent("vaNoData","1")
            end
            if idleCount<5
                idleCount+=1
            end
        end
    end

    def every_15_s()   
        self.set_no_data()
        self.set_clock()
        self.set_wifiStatus()
    end

    def every_100ms()
        import string
        if self.ser.available() > 0
            var msg = self.ser.read()
            if size(msg) > 0
                log(string.format("NXP: Received Raw = %s",str(msg)), 3)
                if (self.flash_mode==1)
                    var strv = msg[0..-4].asstring()
                    if string.find(strv,"comok 2")>=0
                        log("FLH: Send (High Speed) flash start")
						self.flash_start_millis = tasmota.millis()
                        #self.sendnx(string.format("whmi-wris %d,115200,res0",self.flash_size))
                        self.sendnx(string.format("whmi-wris %d,921600,res0",self.flash_size))
						self.ser = serial(17, 16, 921600, serial.SERIAL_8N1)
                    elif size(msg)==1 && msg[0]==0x08
                        log("FLH: Waiting offset...",3)
                        self.awaiting_offset = 1
                    elif size(msg)==4 && self.awaiting_offset==1
                        self.awaiting_offset = 0
                        self.flash_offset = msg.get(0,4)
                        log("FLH: Flash offset marker "+str(self.flash_offset),3)
						if self.flash_offset != 0
							self.open_url_at(self.url, self.flash_offset)
							self.flash_written = self.flash_offset
						end
                        self.write_block()
                    elif size(msg)==1 && msg[0]==0x05
                        self.write_block()
                    else
                        log("FLH: Something has gone wrong flashing display firmware ["+str(msg)+"]",2)
                    end
                else
                    var msg_list = self.split_55(msg)
                    for i:0..size(msg_list)-1
                        msg = msg_list[i]
                        if size(msg) > 0
                            if msg == bytes('000000FFFFFF88FFFFFF')
                                self.screeninit()
                            elif msg[0] == 0x65 # touchPressEventCmd
                                print("serial touch event" +str(msg[0])+" "+str(msg[1])+" "+str(msg[2])+" "+str(msg[3]))
                                var pageNextionId  
                                var compNextionId
                                var event
                                pageNextionId = str(msg[1])
                                compNextionId = str(msg[2])
                                if msg[3] == 0x01 
                                    event = "press"
                                    self.do_defined_work(compNextionId) 
                                else
                                    event = "release" 
                                    self.do_defined_work(compNextionId) 
                                end
                            elif msg[0] == 0x55 && msg[1] == 0xbb #CustomCommand
                                if msg[2] == 0x02 # wakup
                                    tasmota.publish(mqtttopic + "/DISPLAYEVENT",string.format("{\"pageId\":\"%s\", \"event\":\"wakeup\"}",_currentPageId))
                                elif msg[2] == 0x01 # sleep
                                    tasmota.publish(mqtttopic + "/DISPLAYEVENT",string.format("{\"pageId\":\"%s\", \"event\":\"sleep\"}",_currentPageId))
                                end    
                            elif msg[0]==0x07 && size(msg)==1 # BELL/Buzzer
                                tasmota.cmd("buzzer 1,1")                           
                            end
                        end       
                    end
                end
            end
        end
    end      

    def begin_nextion_flash()
        self.flash_written = 0
        self.awaiting_offset = 0
        self.flash_offset = 0
        self.sendnx('DRAKJHSUYDGBNCJHGJKSHBDN')
        self.sendnx('recmod=0')
        self.sendnx('recmod=0')
        self.flash_mode = 1
        self.sendnx("connect")        
    end
    
    def open_url_at(url, pos)
		self.url = url
        import string
        var host
        var port
        var s1 = string.split(url,7)[1]
        var i = string.find(s1,":")
        var sa
        if i<0
            port = 80
            i = string.find(s1,"/")
            sa = string.split(s1,i)
            host = sa[0]
        else
            sa = string.split(s1,i)
            host = sa[0]
            s1 = string.split(sa[1],1)[1]
            i = string.find(s1,"/")
            sa = string.split(s1,i)
            port = int(sa[0])
        end
        var get = sa[1]
        log(string.format("FLH: host: %s, port: %s, get: %s",host,port,get))
        self.tcp = tcpclient()
        self.tcp.connect(host,port)
        log("FLH: Connected:"+str(self.tcp.connected()),3)
        var get_req = "GET "+get+" HTTP/1.0\r\n"
		get_req += string.format("Range: bytes=%d-\r\n", pos)
		get_req += string.format("HOST: %s:%s\r\n\r\n",host,port)
        self.tcp.write(get_req)
        var a = self.tcp.available()
        i = 1
        while a==0 && i<5
          tasmota.delay(100*i)
          tasmota.yield() 
          i += 1
          log("FLH: Retry "+str(i),3)
          a = self.tcp.available()
        end
        if a==0
            log("FLH: Nothing available to read!",3)
            return
        end
        var b = self.tcp.readbytes()
        i = 0
        var end_headers = false;
        var headers
        while i<size(b) && headers==nil
            if b[i..(i+3)]==bytes().fromstring("\r\n\r\n") 
                headers = b[0..(i+3)].asstring()
                self.flash_buff = b[(i+4)..]
            else
                i += 1
            end
        end
        #print(headers)
		# check http respose for code 200/206
        if string.find(headers,"200 OK")>0 || string.find(headers,"206 Partial Content")>0
            log("FLH: HTTP Respose is 200 OK or 206 Partial Content",3)
		else
            log("FLH: HTTP Respose is not 200 OK or 206 Partial Content",3)
			print(headers)
			return -1
        end
		# only set flash size if pos is zero
		if pos == 0
			# check http respose for content-length
			var tag = "Content-Length: "
			i = string.find(headers,tag)
			if (i>0) 
				var i2 = string.find(headers,"\r\n",i)
				var s = headers[i+size(tag)..i2-1]
				self.flash_size=int(s)
			end
			log("FLH: Flash file size: "+str(self.flash_size),3)
		end

    end

    def flash_nextion(url)
        self.flash_size = 0
        var res = self.open_url_at(url, 0)
		if res != -1
			self.begin_nextion_flash()
		end
    end

    def init()
        log("NXP: Initializing Driver")
        self.ser = serial(17, 16, 115200, serial.SERIAL_8N1)
        self.flash_mode = 0
        tasmota.add_cron("*/15 * * * * *", /-> self.every_15_s(), "every_15_s")
    end

end

var nextion = Nextion()

tasmota.add_driver(nextion)

def get_current_version(cmd, idx, payload, payload_json)
	import string
	var version_of_this_script = 4
	var jm = string.format("{\"nlui_driver_version\":\"%s\"}", version_of_this_script)
	tasmota.publish_result(jm, "RESULT")
end

tasmota.add_cmd('GetDriverVersion', get_current_version)

def update_berry_driver(cmd, idx, payload, payload_json)
	def task()
		import string
		var cl = webclient()
		cl.begin(payload)
		var r = cl.GET()
		if r == 200
			print("Sucessfully downloaded nspanel-lovelace-ui berry driver")
		else
			print("Error while downloading nspanel-lovelace-ui berry driver")
		end
		r = cl.write_file("autoexec.be")
		if r < 0
			print("Error while writeing nspanel-lovelace-ui berry driver")
		else
			print("Sucessfully written nspanel-lovelace-ui berry driver")
			var s = load('autoexec.be')
			if s == true
				var jm = string.format("{\"nlui_driver_update\":\"%s\"}", "succeeded")
				tasmota.publish_result(jm, "RESULT")
			else 
				var jm = string.format("{\"nlui_driver_update\":\"%s\"}", "failed")
				tasmota.publish_result(jm, "RESULT")
			end
			
		end
	end
	tasmota.set_timer(0,task)
	tasmota.resp_cmnd_done()
end

tasmota.add_cmd('UpdateDriverVersion', update_berry_driver)

def flash_nextion(cmd, idx, payload, payload_json)
    def task()
        nextion.flash_nextion(payload)
    end
    tasmota.set_timer(0,task)
    tasmota.resp_cmnd_done()
end

def send_cmd(cmd, idx, payload, payload_json)
    nextion.sendnx(payload)
    tasmota.resp_cmnd_done()
end

def send_cmd2(cmd, idx, payload, payload_json)
    nextion.send(payload)
    tasmota.resp_cmnd_done()
end


def send_mqtt(cmd, idx, payload_json, payload_binary)
    import json
    var payload = json.load(payload_json)
    if payload == nil
        return false
    else
        nextion.interpret_mqtt_command("UpdateContent", payload)
    end
    return true
end

tasmota.add_cmd('Nextion', send_cmd)
tasmota.add_cmd('CustomSend', send_cmd2)
tasmota.add_cmd('FlashNextion', flash_nextion)

import mqtt
#to avoid mqtt response message , mqtt.subscribe is used instead of add_cmd
mqtt.subscribe(mqtttopiccmnd + "/UpdateContent",send_mqtt)


tasmota.add_rule("power1#state", /-> nextion.set_power())
tasmota.add_rule("power2#state", /-> nextion.set_power())