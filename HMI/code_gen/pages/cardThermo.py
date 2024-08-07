from shared import *
text = sharedhead + """
            if(tInstruction.txt=="entityUpd")
            {
              //heading
              spstr strCommand.txt,tHeading.txt,"~",1
""" + navigation

text += """
              //entity name
              spstr strCommand.txt,entn.txt,"~",3
              //currentTemp
              spstr strCommand.txt,tCurTemp.txt,"~",4
              //dstTemp
              spstr strCommand.txt,tTmp.txt,"~",5
              covx tTmp.txt,xTempDest1.val,0,0
              xTempDest.val=xTempDest1.val
              //status
              spstr strCommand.txt,tStatus.txt,"~",6
              //minTemp
              spstr strCommand.txt,tTmp.txt,"~",7
              covx tTmp.txt,xTempMin1.val,0,0
              //maxTemp
              spstr strCommand.txt,tTmp.txt,"~",8
              covx tTmp.txt,xTempMax1.val,0,0
              //tempStep
              spstr strCommand.txt,tTmp.txt,"~",9
              covx tTmp.txt,xTempStep1.val,0,0
              // disable all buttons
              vis bt0,0
              vis bt1,0
              vis bt2,0
              vis bt3,0
              vis bt4,0
              vis bt5,0
              vis bt6,0
              vis bt7,0
"""

start = 10
for i in range(0,8):
    idxstart = start + i*4
    text += f"""
              //bt{i}
              spstr strCommand.txt,bt{i}.txt,"~",{idxstart}
              if(bt{i}.txt!="")
              {{
                // set text color on active state
                spstr strCommand.txt,tTmp.txt,"~",{idxstart+1}
                covx tTmp.txt,bt{i}.pco2,0,0
                // set state
                spstr strCommand.txt,tTmp.txt,"~",{idxstart+2}
                covx tTmp.txt,bt{i}.val,0,0
                // save action
                spstr strCommand.txt,va{i}.txt,"~",{idxstart+3}
                //enable
                vis bt{i},1
              }}"""

text += """
              //Text tCurTempLbl
              spstr strCommand.txt,tCurTempLbl.txt,"~",42
              //Text tStateLbl
              spstr strCommand.txt,tStateLbl.txt,"~",43
              //Text tALbl
              spstr strCommand.txt,tALbl.txt,"~",44
              //Text tCF
              spstr strCommand.txt,tCF.txt,"~",45
              tCF1.txt=tCF.txt
              tCF2.txt=tCF.txt
              //Second Temperature
              spstr strCommand.txt,tTmp.txt,"~",46
              if(tTmp.txt!="")
              {
                covx tTmp.txt,xTempDest2.val,0,0
                vis btUp,0
                vis xTempDest,0
                vis btDown,0
                vis tCF,0
                vis btUp1,1
                vis xTempDest1,1
                vis btDown1,1
                vis tCF1,1
                vis bUp2,1
                vis xTempDest2,1
                vis bDown2,1
                vis tCF2,1
              }
            }
""" + sharedfoot
print(text)

