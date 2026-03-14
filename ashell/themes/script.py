"""
To set Matugen colors with post_hook
"""

if __name__ == "__main__":
    import toml
    import json

    with open('/home/ian/.config/ashell/config.toml', 'r') as f:
        ashell = toml.load(f)
    with open('/home/ian/.config/ashell/themes/matugen.json', 'r') as f:
        matugen = json.load(f)
        colors = matugen["colors"]

    appearance = ashell.get("appearance", {})
    # primary
    appearance["primary_color"]["base"] = colors["primary_container"]
    appearance["primary_color"]["text"] = colors["primary"]

    # danger
    appearance["danger_color"]["base"] = colors["error"]
    appearance["danger_color"]["weak"] = colors["error"]

    # background
    appearance["background_color"]["base"] = colors["background"]
    appearance["background_color"]["weak"] = colors["surface"]
    appearance["background_color"]["strong"] = colors["surface_bright"]

    # secondary
    appearance["secondary_color"]["base"] = colors["secondary"]

    ashell["appearance"] = appearance

    with open('/home/ian/.config/ashell/config.toml', 'w') as f:
        toml.dump(ashell, f)
