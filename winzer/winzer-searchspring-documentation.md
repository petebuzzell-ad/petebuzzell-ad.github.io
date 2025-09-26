# SearchSpring Configuration Documentation

**Platform:** Winzer eCommerce Sites (Winzer, OneSource, FastServ)  
**Integration:** SearchSpring + Shopify Plus  
**Last Updated:** September 26, 2025  
**Purpose:** Comprehensive guide to SearchSpring filter configuration and management

## Table of Contents

- [SearchSpring Overview](#searchspring-overview)
- [Filter Types & Configuration](#filter-types--configuration)
- [Image-Based Filters](#image-based-filters)
- [Generic Head Type Filter](#generic-head-type-filter)
- [Generic Color Filter](#generic-color-filter)
- [Filter Visibility Rules](#filter-visibility-rules)
- [Shopify Integration](#shopify-integration)
- [Filter Management](#filter-management)
- [Troubleshooting](#troubleshooting)
- [Best Practices](#best-practices)

---

## SearchSpring Overview

SearchSpring is the search and filtering solution integrated with all three Winzer eCommerce sites. It provides:

- **Advanced Search:** Intelligent search with typo tolerance and suggestions
- **Dynamic Filtering:** Real-time product filtering based on attributes
- **Visual Filters:** Image-based filters for enhanced user experience
- **Analytics:** Search and filter performance tracking
- **Mobile Optimization:** Responsive filtering interface

> **Note:** SearchSpring pulls filter data directly from Shopify's product attributes and metafields, ensuring real-time synchronization with product data.

## Filter Types & Configuration

### Standard Filter Types

| Filter Type              | Data Source                | Display Format           | Use Case                          |
| ------------------------ | -------------------------- | ------------------------ | --------------------------------- |
| **Text Filters**         | Product attributes, tags   | Checkbox list            | Brand, category, features         |
| **Range Filters**        | Numeric metafields         | Slider or input fields   | Price, dimensions, specifications |
| **Image Filters**        | Custom metafields + images | Visual icons with labels | Colors, head types, materials     |
| **Hierarchical Filters** | Category structure         | Nested tree structure    | Product categories, subcategories |

## Image-Based Filters

Image-based filters provide a more intuitive shopping experience by allowing customers to filter products using visual cues rather than text alone. These filters require specific naming conventions and file organization.

### Image Filter Requirements

- **File Format:** SVG (preferred for scalability) or PNG
- **Dimensions:** 32x32px minimum, 64x64px recommended
- **Naming Convention:** Must match filter values exactly with specific prefixes
- **Storage Location:** Shopify Files (CDN hosted)
- **Optimization:** Compressed for web performance

## Generic Head Type Filter

The Generic Head Type filter allows customers to filter products by the type of head or connector. This filter uses images to represent different head types, making it easier for customers to identify the specific connector they need.

### Configuration Details

| Setting          | Value             | Description                            |
| ---------------- | ----------------- | -------------------------------------- |
| **Filter Name**  | Generic Head Type | Display name in the filter panel       |
| **Data Source**  | Product metafield | Pulls from custom metafield in Shopify |
| **Display Type** | Image Grid        | Shows images in a grid layout          |
| **Image Source** | Shopify Files     | Images stored in Shopify Files section |

### Image Naming Convention

Images for the Generic Head Type filter must follow this exact naming pattern:

```
ss_generic_head_type__[VALUE].svg
```

### Supported Head Types

| Head Type   | Image Filename                              | Description                |
| ----------- | ------------------------------------------- | -------------------------- |
| Flat Head   | `ss_generic_head_type__flat-head.svg`       | Flat head screws and bolts |
| Pan Head    | `ss_generic_head_type__pan-head.svg`        | Pan head fasteners         |
| Round Head  | `ss_generic_head_type__round-head.svg`      | Round head screws          |
| Socket Head | `ss_generic_head_type__socket-head.svg`     | Socket head cap screws     |
| Button Head | `ss_generic_head_type__button-head.svg`     | Button head screws         |
| Hex Head    | `ss_generic_head_type__hex-head.svg`        | Hex head bolts and screws  |

> **Important:** The image filename must exactly match the filter value in the product data. Case sensitivity matters - use lowercase with hyphens. Images are hosted on Shopify's CDN at `store.winzer.com/cdn/shop/files/`.

> **Example:** The flat head image is accessible at: https://store.winzer.com/cdn/shop/files/ss_generic_head_type__flat-head.svg

## Generic Color Filter

The Generic Color filter allows customers to filter products by color using visual color swatches. This is particularly useful for products where color is a key differentiator.

### Configuration Details

| Setting          | Value           | Description                                 |
| ---------------- | --------------- | ------------------------------------------- |
| **Filter Name**  | Color           | Display name in the filter panel            |
| **Data Source**  | Product options | Pulls from Shopify product color options    |
| **Display Type** | Color Swatches  | Shows color circles/swatches                |
| **Image Source** | Shopify Files   | Color swatch images stored in Shopify Files |

### Color Image Naming Convention

Color swatch images must follow this exact naming pattern:

```
color-[COLOR-NAME].png
```

### Supported Colors

| Color Name | Image Filename     | Hex Code |
| ---------- | ------------------ | -------- |
| Black      | `color-black.png`  | #000000  |
| White      | `color-white.png`  | #FFFFFF  |
| Red        | `color-red.png`    | #FF0000  |
| Blue       | `color-blue.png`   | #0000FF  |
| Green      | `color-green.png`  | #00FF00  |
| Yellow     | `color-yellow.png` | #FFFF00  |
| Silver     | `color-silver.png` | #C0C0C0  |
| Gold       | `color-gold.png`   | #FFD700  |

## Filter Visibility Rules

SearchSpring automatically manages filter visibility based on several rules to ensure a clean, relevant filtering experience.

### Automatic Visibility Rules

- **Minimum Product Count:** Filters only appear if they have 3+ products
- **Value Variation:** Filters are hidden if all products have the same value
- **Empty Values:** Filters with empty or null values are automatically hidden
- **Category Context:** Some filters only appear in specific categories

### Manual Filter Management

Administrators can manually control filter visibility through the SearchSpring dashboard:

1. **Access SearchSpring Dashboard** - Log into the SearchSpring admin panel
2. **Navigate to Filters** - Go to the Filters section
3. **Select Filter** - Choose the filter to modify
4. **Adjust Settings** - Modify visibility rules and display options
5. **Save Changes** - Apply changes to the live site

## Shopify Integration

SearchSpring integrates with Shopify through several data sources and synchronization methods.

### Data Synchronization

- **Product Data:** Real-time sync of product information
- **Inventory Levels:** Live inventory status updates
- **Pricing:** Automatic price synchronization
- **Categories:** Collection and category structure sync
- **Attributes:** Product attributes and metafields sync

### Metafield Mapping

| SearchSpring Filter | Shopify Metafield  | Data Type        |
| ------------------- | ------------------ | ---------------- |
| Generic Head Type   | `custom.head_type` | Single line text |
| Color               | `custom.color`     | Single line text |
| Material            | `custom.material`  | Single line text |
| Size                | `custom.size`      | Single line text |
| Brand               | `custom.brand`     | Single line text |

## Filter Management

### Adding New Filters

1. **Create Metafield** - Add the metafield in Shopify admin
2. **Populate Data** - Ensure products have values for the new metafield
3. **Configure in SearchSpring** - Set up the filter in SearchSpring dashboard
4. **Add Images (if needed)** - Upload filter images following naming conventions
5. **Test Filter** - Verify the filter works correctly on the frontend

### Modifying Existing Filters

1. **Update Metafield Data** - Modify product data in Shopify
2. **Adjust Filter Settings** - Update filter configuration in SearchSpring
3. **Update Images** - Replace or add new filter images as needed
4. **Clear Cache** - Clear SearchSpring cache to see changes

## Troubleshooting

### Common Issues

> **Filter Not Appearing:** Check if the filter has at least 3 products with different values. Also verify the metafield is properly populated.

> **Images Not Showing:** Verify the image filename exactly matches the filter value. Check that images are uploaded to Shopify Files.

> **Filter Values Not Updating:** Clear the SearchSpring cache and wait for the next sync cycle (usually within 15 minutes).

### Debugging Steps

1. **Check Product Data** - Verify metafields are populated correctly
2. **Review Filter Settings** - Ensure filter is configured properly in SearchSpring
3. **Test Image URLs** - Verify image files are accessible
4. **Clear Caches** - Clear both Shopify and SearchSpring caches
5. **Check Console** - Look for JavaScript errors in browser console

## Best Practices

### Image Management

- **Consistent Sizing:** Use uniform dimensions for all filter images
- **High Quality:** Use high-resolution images that scale well
- **Optimized Files:** Compress images for faster loading
- **Descriptive Names:** Use clear, descriptive filenames
- **Backup Images:** Keep backup copies of all filter images

### Filter Organization

- **Logical Ordering:** Arrange filters in order of importance
- **Clear Labels:** Use descriptive filter names
- **Consistent Values:** Standardize metafield values across products
- **Regular Audits:** Periodically review and clean up unused filters

### Performance Optimization

- **Limit Filter Count:** Don't overload the filter panel
- **Optimize Images:** Use appropriate file sizes and formats
- **Cache Management:** Clear caches after making changes
- **Monitor Performance:** Track filter usage and performance metrics

---

## Support & Questions

For questions about SearchSpring configuration or filter management, contact:

**Arcadia Digital Support:** support@arcadiadigital.com  
**SearchSpring Documentation:** https://docs.searchspring.com
