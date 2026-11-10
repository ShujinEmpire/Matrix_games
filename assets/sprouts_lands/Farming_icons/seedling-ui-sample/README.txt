Seedling UI Mini Sample — version 0.1

Free sample by kitakitsksi / Project Genesis (AI-assisted). Licensed CC BY 4.0; see LICENSE.md for attribution and terms.

CONTENTS
4 farming icons: seed_packet, water_drop, growing_sprout, harvest_basket.
1 inventory_slot frame, with a transparent center.
1 blank button, exported in normal, hover, pressed and disabled states.
9 SVG variants and 36 transparent RGBA PNGs total.

SIZES
The numbered PNG folders specify image HEIGHT, not icon count:
32: icons/frame 32x32; buttons 96x32.
64: icons/frame 64x64; buttons 192x64.
128: icons/frame 128x128; buttons 384x128.
256: icons/frame 256x256; buttons 768x256.
SVG icons/frame use a 64x64 viewBox; buttons use 192x64.
manifest.json lists every file and exact dimensions.

USE
Import individual PNGs as ordinary images in your chosen engine/editor. Choose a size that matches your target UI and preserve aspect ratio. Add button labels with your engine's own text controls. Match each button state to the engine's state image or texture slot; no behavior is built into these images.
For an inventory display, place the transparent slot above or behind a suitably inset icon. Start with the icon at 75–85% of the frame canvas size to keep its outline clear of the frame. Review the result on your actual background.
Edit the SVG colors and geometry in a compatible vector editor. SVGs use only basic shapes and polygons, with no fonts, scripts, linked resources, animation or gradients.

The button is a fixed 3:1 design, not a tested nine-slice control. Stretching may distort corners. No sprite atlas, engine project, plugin, scene, animation or full farming game is included. The preview is a static layout example. The delivered assets are blank: preview labels, backgrounds and cards are not individual pack assets.

READABILITY
32 px exports favor silhouette over detail. Seed artwork and basket contents lose detail at that size. The deep outline is less visible on a matching dark-green background, so compare against your game's colors. 64 px or larger is preferred for detailed inventory displays. This is smooth vector-style art, not hand-tuned pixel art or hand-painted illustration. No accessibility certification is claimed.

PROVENANCE
Created with AI assistance through code-authored vector geometry and local raster exports. No third-party artwork or font files are included. Typography appears only in the flattened preview images. Engine integration has not been tested; no Godot, Unity or other engine compatibility endorsement is claimed.
