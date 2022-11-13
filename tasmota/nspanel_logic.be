# Sonoff NSPanel Tasmota Lovelace UI Berry Driver | code by joBr99
# based on;
# Sonoff NSPanel Tasmota (Nextion with Flashing) driver | code by peepshow-21
# based on;
# Sonoff NSPanel Tasmota driver v0.47 | code by blakadder and s-hadinger

# Example Flash
# FlashNextion http://ip-address-of-your-homeassistant:8123/local/nspanel.tft
# FlashNextion http://nspanel.pky.eu/lui.tft

var debug = false

var mqtttopic = "tele/tasmota_C851C0" 
var mqtttopiccmnd = "cmnd/tasmota_C851C0" 
# wenn bei publish_result der subtopic funktionieren sollte kann das hier entfernt werden, 
# ansonsten geht mir auch die info ab wie und ob der TOPIC in einer Globalenvariable versteckt ist, doku ist nichts zu findne.

var componentTypeText = 1
var componentTypeButton = 2
var componentTypeStateButton = 3
var componentTypeIntVar = 4
var componentTypeHotspot = 5
var componentTypeSlider = 6
var componentTypePic = 7


var actionUsebackNav = 1 # for popup pages
var actionShowPopup = 2
var actionShowPage = 3
var actionRaiseEvent = 4

var indexPageName = 0
var indexBackNam = 1
var indexComponents = 2
var indexSysComponents = 3

var sysComponentStore = {}

var widget = {"0": ["sysPopup", "", [["3", "buttonClose", 2, 1, "1", 1, "", "", "", "", ""], ["9", "txtIp", 1, 1, "0", "", "", "", "", "", ""], ["2", "sliderDim", 6, 1, "0", "", "", "", "", "", ""]], [["12", "tTime", 1], ["7", "vaWifi", 4]]], "1": ["cardSolar", "", [["21", "vaSolarPanel", 4, 1, "0", "", "powerSolar", "", "", "", ""], ["20", "vaBattery", 4, 1, "0", "", "powerBattery", "", "", "", ""], ["55", "vaHouse", 4, 1, "0", "", "powerHouse", "", "", "", ""], ["19", "vaGrid", 4, 1, "0", "", "powerGrid", "", "", "", ""], ["26", "vaBatteryChaS", 4, 1, "0", "", "batteryChargeState", "", "", "", ""], ["29", "mSys", 5, "", "0", 2, "", "", "", "", ""], ["10", "mRight", 5, "", "2", 3, "", "", "", "", ""], ["49", "mleft", 5, "", "3", 3, "", "", "", "", ""]], [["61", "tTime", 1], ["63", "vaWifi", 4], ["47", "txtNoData", 1], ["59", "vaNoData", 4]]], "2": ["cardWindow", "", [["19", "mSys", 5, "", "0", 2, "", "", "", "", ""], ["47", "mRight", 5, "", "3", 3, "", "", "", "", ""], ["42", "mleft", 5, "", "1", 3, "", "", "", "", ""], ["23", "p1", 7, 1, "30", "", "T_WindowSleepingRoom_IsOpen", {"OPEN": "31", "CLOSED": "30"}, "", "", ""], ["22", "txtWindow1", 1, 1, "Schlafzimmer", "", "", "", "", "", ""], ["24", "p2", 7, 1, "30", "", "T_WindowChild1Room_IsOpen", {"OPEN": "31", "CLOSED": "30"}, "", "", ""], ["25", "t0", 1, 1, "Anja", "", "", "", "", "", ""], ["26", "p3", 7, 1, "30", "", "T_WindowChild2Room_IsOpen", {"OPEN": "31", "CLOSED": "30"}, "", "", ""], ["27", "t1", 1, 1, "Benjamin", "", "", "", "", "", ""], ["28", "p4", 7, 1, "30", "", "T_WindowBath_IsOpen", {"OPEN": "31", "CLOSED": "30"}, "", "", ""], ["29", "t2", 1, 1, "Bad", "", "", "", "", "", ""], ["30", "p5", 7, 1, "30", "", "T_WindowKitchen_IsOpen", {"OPEN": "31", "CLOSED": "30"}, "", "", ""], ["31", "t3", 1, 1, "Kueche", "", "", "", "", "", ""], ["32", "p6", 7, 1, "30", "", "T_WindowWC_IsOpen", {"OPEN": "31", "CLOSED": "30"}, "", "", ""], ["41", "t8", 1, 1, "Klo", "", "", "", "", "", ""], ["33", "p7", 7, 1, "30", "", "T_WindowLivingRoom_IsOpen", {"OPEN": "31", "CLOSED": "30"}, "", "", ""], ["40", "t7", 1, 1, "Terrasse", "", "", "", "", "", ""], ["34", "p8", 7, 1, "30", "", "T_WindowDummy_IsOpen", {"OPEN": "31", "CLOSED": "30"}, "", "", ""], ["39", "t6", 1, 1, "Haustuer", "", "", "", "", "", ""], ["35", "p9", 7, 1, "30", "", "T_WindowHobbyRoom1_IsOpen", {"OPEN": "31", "CLOSED": "30"}, "", "", ""], ["38", "t5", 1, 1, "HobbyR", "", "", "", "", "", ""], ["36", "p10", 7, 1, "30", "", "T_WindowHobbyRoom2_IsOpen", {"OPEN": "31", "CLOSED": "30"}, "", "", ""], ["37", "t4", 1, 1, "HobbyL", "", "", "", "", "", ""]], [["45", "tTime", 1], ["46", "vaWifi", 4]]], "3": ["cardGrid", "", [["38", "mSys", 5, "", "0", 2, "", "", "", "", ""], ["36", "mRight", 5, "", "1", 3, "", "", "", "", ""], ["39", "mleft", 5, "", "2", 3, "", "", "", "", ""], ["20", "bEntity1", 2, 1, "0", 4, "Power_Light_Tisch", {"ON": "1", "OFF": "0"}, "", {"1": "65504", "0": "65535"}, ""], ["3", "tEntity1", 1, 1, "Esstisch", "", "", "", "", "", ""], ["21", "bEntity2", 2, 1, "0", 4, "Power_Light_Ecke", {"ON": "1", "OFF": "0"}, "", {"1": "65504", "0": "65535"}, ""], ["22", "tEntity2", 1, 1, "Ecke", "", "", "", "", "", ""], ["23", "bEntity3", 2, 1, "0", 4, "Power_Light_Couch", {"ON": "1", "OFF": "0"}, "", {"1": "65504", "0": "65535"}, ""], ["24", "tEntity3", 1, 1, "Couch", "", "", "", "", "", ""], ["25", "bEntity4", 2, 1, "0", 4, "Power_Light_Wall", {"ON": "1", "OFF": "0"}, "", {"1": "65504", "0": "65535"}, ""], ["26", "tEntity4", 1, 1, "Wand", "", "", "", "", "", ""], ["28", "bEntity5", 2, 1, "0", 4, "Power_TV_Plug", {"ON": "1", "OFF": "0"}, "", "", {"1": "", "0": ""}], ["27", "tEntity5", 1, 1, "TV", "", "", "", "", "", ""], ["29", "bEntity6", 2, 1, "0", 4, "PowerOffAllWohnzimmer", "", "", {"0": "43072"}, ""], ["30", "tEntity6", 1, 1, "Power OFF ALL", "", "", "", "", "", ""]], [["41", "tTime", 1], ["43", "vaWifi", 4]]]}


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
        if (self.flash_mode==1)
            return
        end
        var ps = tasmota.get_power()  
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
        dlog("sendnx:"+ payload)
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
        if (self.flash_mode==1)
            return
        end
        import string         
        dlog("change_page to " + pageId)
        _currentPageId = pageId
        var pageToNav = widget[pageId][0] 
     
        self.sendnx(string.format("page %s",pageToNav))
        self.init_current_page()
        print("do_defined_work_4")
        tasmota.publish(mqtttopic + "/PAGEEVENT",string.format("{\"pageId\":\"%s\"}",pageId))  
    end

    def init_current_page()
        import string                 
        dlog("prepare_page:" + _currentPageId)
        for comp:widget[_currentPageId] [indexComponents]         
            var isVisible = "0"
            if comp[3] != "" 
                isVisible = comp[3]
            end           
          
            self.write_visibilty_to_component(comp[2],comp[1],isVisible)       
            if comp[8] != ""
                dlog("text is set")
                self.write_text_to_component(comp[2],comp[1],comp[8])         
            end
          
            self.update_component_value(comp[1],comp[4])
        end
        for compsys:widget[_currentPageId][indexSysComponents]  
            if sysComponentStore.contains(compsys[1]) 
                self.write_value_to_component(compsys[2],compsys[1],sysComponentStore[compsys[1]] )
            end
        end    
        self.set_power()
    end    
    def write_visibilty_to_component(compType,compName,isVisible)    
        import string
        if (self.flash_mode==1)
            return
        end
        if compType == componentTypeText                      
            self.sendnx(string.format("vis %s,%s",compName,isVisible))
        elif compType== componentTypeButton                      
            self.sendnx(string.format("vis %s,%s",compName,isVisible))        
        elif compType== componentTypeStateButton                      
            self.sendnx(string.format("vis %s,%s",compName,isVisible))     
        elif compType == componentTypePic            
            self.sendnx(string.format("vis %s,%s",compName,isVisible))            
        end
    end
    def write_value_based_color_to_component(compName,value,mapping)       
        import string        
        if (self.flash_mode==1)
            return
        end
        if mapping.contains(value)
            self.sendnx(string.format("%s.pco=%s",compName,mapping[value],value)) 
        end
    end
    def write_text_to_component(compType,compName,compText)    
        import string
        if (self.flash_mode==1)
            return
        end
        if compType == componentTypeButton       
            self.sendnx(string.format("%s.txt=\"%s\"",compName,compText))          
        elif compType== componentTypeStateButton           
            self.sendnx(string.format("%s.txt=\"%s\"",compName,compText))            
        end
    end

    def write_value_to_component(compType,compName,compValue)     
        import string
        if (self.flash_mode==1)
            return
        end
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


    def handle_nextion_events(componentId,eventType)     
        import string    
        dlog("handle_nextion_events")        
        for comps:widget[_currentPageId][indexComponents]    
            if comps[0] == componentId
                dlog(comps[4])
                if comps[2] == componentTypeButton || comps[2] == componentTypeHotspot                    
                    var action = comps[5]
                    print(string.format("do action:%s",action))
                    if action == actionShowPage
                        self.change_page(comps[4])
                    elif action == actionShowPopup
                        dlog("page:" +_currentPageId)                       
                        widget[comps[4]].setitem(indexBackNam,_currentPageId)
                        self.change_page(comps[4])
                        #_currentPageId = comps[4]
                        #dlog("to page:" + comps[4])
                        #var pageToNav=widget[comps[4]][indexPageName]      
                        #self.sendnx(string.format("page %s",pageToNav))
                        #self.prepare_page(comps[4])    
                    elif action == actionUsebackNav
                        self.change_page(widget[_currentPageId][indexBackNam])
                    elif action == actionRaiseEvent
                        tasmota.publish(mqtttopic +"/BUTTONEVENT",string.format("{\"pageId\":\"%s\", \"component\":\"%s\",\"event\":\"%s\"}",_currentPageId,comps[6],eventType))
                    end    
                end
                break
            end
        end               
         
    end
        
    def update_component_mqtt(pageId,name,value)     
        dlog("update_component_mqtt" + pageId + ";" + name + ";" + value)                    
        for comps:widget[_currentPageId][indexComponents]   
            if comps[6] != "" #mqttMappin
                if comps[6] == name     
                    if comps[7] != ""
                        if comps[7].contains(value)
                            dlog("replace value " + value +" with " + comps[7][value])
                            value = comps[7][value]
                        end
                    end                                  
                    if _currentPageId == pageId
                        self.update_component_value(comps[1],value)      
                    else
                        comps.setitem(4,value)
                    end
                end
            end
        end 
    end
    #used driver internally
    def update_component_value(name,value)  
        dlog("update_component_value")                     
        for comps:widget[_currentPageId][indexComponents]   
            if comps[1] == name
                comps.setitem(4,value)
                self.write_value_to_component(comps[2],name,value)  
                if comps[9] != ""
                    self.write_value_based_color_to_component(name,value,comps[9])
                end     
                if comps[10] != "" # valueBasedText
                    if comps[10].contains(comps[4])
                        self.write_text_to_component(comps[2],comps[1],comps[10][comps[4]])  
                    end
                end             
            end
        end 
    end

    def change_syscomponent_visibility(name,value) 
        dlog("change_syscomponent_visibility")                       
        for comps:widget[_currentPageId][indexSysComponents]   
            if comps[1] == name
                self.write_visibilty_to_component(comps[2],comps[1],value)             
            end
        end 
    end

    def update_syscomponent(name,value)      
        dlog("update_syscomponent:" +name + ";" + value)                 
        for comps:widget[_currentPageId][indexSysComponents]         
            if comps[1] == name
                self.write_value_to_component(comps[2],comps[1],value)             
            end
        end 
        dlog("update_syscomponent_end")
        if sysComponentStore.contains(name)
            sysComponentStore[name] = value
        else
            sysComponentStore.insert(name,value)            
        end
    end

    
    def handle_mqtt_command(cmd, payload_json)
        dlog("handle_mqtt_command")
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
            self.update_component_value("txtIp",wifi["ip"])            
        end
        self.update_syscomponent("vaWifi",str(value))
    end

    def set_no_data()
        
        if _currentPageId == 1 
            if idleCount == 0
                self.change_syscomponent_visibility("txtNoData",0)
                self.update_syscomponent("vaNoData","0")
            elif idleCount == 4
                self.change_syscomponent_visibility("txtNoData",1)
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
                              
                                pageNextionId = str(msg[1])
                                compNextionId = str(msg[2])
                                if msg[3] == 0x01                              
                                    self.handle_nextion_events(compNextionId,"pressed") 
                                else 
                                    self.handle_nextion_events(compNextionId,"released") 
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
        import string
        log("NXP: Initializing Driver")
        self.ser = serial(17, 16, 115200, serial.SERIAL_8N1)
        self.flash_mode = 0
        tasmota.add_cron("*/15 * * * * *", /-> self.every_15_s(), "every_15_s")
        self.change_page(_currentPageId)     
        tasmota.publish(mqtttopic + "/DISPLAYEVENT",string.format("{\"pageId\":\"%s\", \"event\":\"wakeup\"}",_currentPageId))
    end

end


def get_current_version(cmd, idx, payload, payload_json)
	import string
	var version_of_this_script = 4
	var jm = string.format("{\"nlui_driver_version\":\"%s\"}", version_of_this_script)
	tasmota.publish_result(jm, "RESULT")
end


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

var nextion = Nextion()

def flash_nextion(cmd, idx, payload, payload_json)
    def task()
        nextion.flash_nextion(payload)
    end
    tasmota.set_timer(0,task)
    tasmota.resp_cmnd_done()
end

def send_cmd(cmd, idx, payload, payload_json)
    if (nextion.flash_mode==1)
        return
    end
    nextion.sendnx(payload)
    tasmota.resp_cmnd_done()
end


def send_mqtt(cmd, idx, payload_json, payload_binary)
    import json
    var payload = json.load(payload_json)
    if payload == nil
        return false
    else
        nextion.handle_mqtt_command("UpdateContent", payload)
    end
    return true
end




log("add mqtt handler to GetDriverVersion")
tasmota.add_cmd('GetDriverVersion', get_current_version)
log("add mqtt handler to UpdateDriverVersion")
tasmota.add_cmd('UpdateDriverVersion', update_berry_driver)

log("add mqtt handler to Nextion")
tasmota.add_cmd('Nextion', send_cmd)
log("add mqtt handler to FlashNextion")
tasmota.add_cmd('FlashNextion', flash_nextion)


import mqtt
#to avoid mqtt response message , mqtt.subscribe is used instead of add_cmd
log("add mqtt handler to UpdateContent")
mqtt.subscribe(mqtttopiccmnd + "/UpdateContent",send_mqtt)

log("add rule handler to power1#state")
tasmota.add_rule("power1#state", /-> nextion.set_power())
log("add rule handler to power2#state")
tasmota.add_rule("power2#state", /-> nextion.set_power())

tasmota.add_driver(nextion) 