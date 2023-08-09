# Image Processing Scripts

This repository contains a collection of scripts for image processing, specifically for generating WebP formats and creating favicons.

## Requirements

The scripts require the following software to be installed on your macOS:

- [ImageMagick](https://imagemagick.org/index.php)
- [WebP](https://developers.google.com/speed/webp/download)

You can install these requirements via Homebrew:

```bash
brew install imagemagick webp
```

## Scripts

### 1. WebP Generation

The script `webp.sh` is used to resize images to specific dimensions and convert them to both PNG and WebP formats.

You will be prompted to select one or more images. After selecting the images, the script will resize each one to three different dimensions (320, 768, and 1024 pixels wide) and convert each resized image to PNG and WebP formats.

To run this script:

```bash
chmod +x webp.sh
./webp.sh
```

### 2. Favicon Creation

The script `icon.sh` creates a favicon from an image file.

You will be prompted to select an image file (PNG, JPG, and GIF are supported) and the directory of your Next.js project. The script will then create a favicon and place it in the correct directory, whether or not your project uses a `src` directory.

To run this script:

```bash
chmod +x icon.sh
./icon.sh
```
# Next.js 

.create-page.sh
is a script to generate necessary files for a folder using the new app router, pass the page name as a parameter make sure it is all lowercase 


## Contribute

Feel free to open an issue or submit a PR if you find any issues or have improvements to suggest.

## License

MIT License. See [LICENSE](./LICENSE) for more information.
