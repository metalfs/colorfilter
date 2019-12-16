# Metal FS Color Filter Operator

This operator takes a bitmap file as the input, transforms it to grayscale except pixels with red as the dominant color.

For general information on Metal FS, please visit the [project website](https://metalfs.github.io).

## Installation
```
npm install @metalfs/colorfilter
```

Example `image.json`:
```json
{
    "streamBytes": 8,
    "target": "SNAP/WebPACK_Sim",
    "operators": {
        "colorfilter": "@metalfs/colorfilter"
    }
}
```

## Operator Details

| | Description |
 -| -
Input  | Stream of bitmap data with a 138-byte header.
Output | Transformed bitmap data.
Stream Width | Adaptable

### Options

No options are available.
