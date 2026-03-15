if __name__ == "__main__":
    from openrgb import OpenRGBClient
    from openrgb.utils import DeviceType, RGBColor

    # get colorscheme
    try:
        with open(
            "/home/ian/.config/matugen/scripts/openrgb/colorscheme.txt", "r"
        ) as f:
            colorscheme = f.read()
    except Exception as e:
        print(e)

    print("Colorscheme", colorscheme)

    cli = OpenRGBClient()  # using defaults
    for _type in DeviceType:
        devices = cli.get_devices_by_type(_type)

        print(len(devices), _type.name)

        for device in devices:
            try:
                device.set_mode("direct")
                device.set_color(RGBColor.fromHEX(colorscheme))
                print("Successfully set color to device", device.name)
            except Exception as e:
                print("Failed to set color to device", device.name, e)
