# NSPanel Lovelace UI

If you like this project consider buying me a pizza 🍕 <a href="https://paypal.me/joBr99" target="_blank"><img src="https://img.shields.io/static/v1?logo=paypal&label=&message=donate&color=slategrey"></a>

[![hacs_badge](https://img.shields.io/badge/HACS-Default-41BDF5.svg)](https://github.com/hacs/integration)
![hacs validation](https://github.com/joBr99/nspanel-lovelace-ui/actions/workflows/hacs-validation.yaml/badge.svg)
[![Man Hours](https://img.shields.io/endpoint?url=https%3A%2F%2Fmh.jessemillar.com%2Fhours%3Frepo%3Dhttps%3A%2F%2Fgithub.com%2FjoBr99%2Fnspanel-lovelace-ui.git)](https://jessemillar.com/r/man-hours)

NsPanel Lovelace UI is a Firmware for the nextion screen inside of NSPanel in the Design of [HomeAssistant](https://www.home-assistant.io/)'s Lovelace UI Design.

**EU Model and US Model supported (in portrait and landscape orientation)**

Content of the screen is controlled by a AppDaemon Python Script installed on your HomeAssistant Instance.

Or an TypeScript on your ioBroker Instance in case you are an ioBroker User.

NsPanel needs to be flashed with Tasmota (or upcoming with ESPHome)

![nspanel-rl](docs/img/nspanel-rl.png)

## Features

- Entities Page with support for cover, switch, input_boolean, binary_sensor, sensor, button, number, scenes, script, input_button and light, input_text (read-only), lock, fan and automation
- Grid Page with support for cover, switch, input_boolean, button, scenes, light, lock and automation
- Detail Pages for Lights (Brightness, Temperature and Color of the Light) and for Covers (Position)
- Thermostat Page 
- Media Player Card
- Alarm Control Card
- Screensaver Page with Time, Date and Weather Information
- Card with QrCode to display WiFi Information
- Localization possible (currently 38 languages)
- **Everything is dynamically configurable by a yaml config, no need to code or touch Nextion Editor**

It works with [Tasmota](https://tasmota.github.io/docs/) and MQTT. 
To control the panel and update it with content from HomeAssistant there is an [AppDaemon](https://github.com/AppDaemon/appdaemon) App.

See the following picture to get an idea of the look of this firmware for NSPanel.

![screens](doc-pics/screens.png)

Some (not all) screenshots from the US Portrait Version:

![screens-us-p](doc-pics/screens-us-p.png)


## Fork Changes

### SolarCard
Show the current power flow from house to grid, battery and solar system
![screens-cardSolar](doc-pics/card-solar.png)

Protocol:
entityUpd~test~~0~1010~0~1010~0
<command>~<dummy>~<empty>~<BatteryChargePercent>~<Grid Power Usage>~<Solar Generator Power>~<House Consumption>~<Battery Generator Power>

### WindowCard
Shows the status of the house windows

Protocol:
sysUpd~online~192.168.5.10
sysUpd~offline~

### SysPopup
Allows to change the brightness settings, and shows system informations
![screens-sysPopup](doc-pics/sysPopup.PNG)
## Documentation

Visit https://docs.nspanel.pky.eu/ for installation instructions and documentation of the configuration.
