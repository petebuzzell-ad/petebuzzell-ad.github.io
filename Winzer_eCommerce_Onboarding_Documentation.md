# Winzer eCommerce Director Onboarding Documentation

**From:** Arcadia Digital  
**To:** Winzer eCommerce Team  
**Date:** [Current Date]  
**Purpose:** Formal handoff documentation for Winzer's Shopify Plus eCommerce operations

---

## Table of Contents

1. [Arcadia Digital Handoff Overview](#arcadia-digital-handoff-overview)
2. [Content Management](#content-management)
3. [Product Management](#product-management)
4. [Site Management](#site-management)
5. [Custom Elements](#custom-elements)
6. [Operations](#operations)

---

## Arcadia Digital Handoff Overview

### Current State
Winzer operates three distinct Shopify Plus stores under a unified architecture:

- **OneSource** (`winzeronesource.myshopify.com`) - Primary DTC store
- **FastServ** (`winzerfastserv.myshopify.com`) - Fastserv Supply Co B2B store
- **Winzer Corp** (`winzercorp.myshopify.com`) - Winzer B2B store

### Architecture Overview
The Winzer eCommerce platform uses a **Dawn-based, multi-site architecture** developed by CQL Corp. This "cartridge-style" system allows all three sites to share core functionality while maintaining brand-specific customizations.

**Key Architecture Points:**
- Base theme: Shopify Dawn (latest version)
- Shared core: `sites/_shared/` directory
- Site-specific overrides: Individual site directories
- SearchSpring integration: Custom search and filtering
- Node.js build system with Webpack

---

## Content Management

### Page Management
All three sites use standard Shopify page management with custom sections:

**Current Page Inventory:**
- **39 Total Pages** across all sites
- **Key Page Types:** Informational content, product guides, company information
- **Content Examples:** "How to Choose the Right Threadlocker for Your Home Projects", "Chat with an Expert"
- **SEO Content:** Comprehensive page metadata and structured content

**Key Page Types:**
- Standard pages (About, Contact, Policies)
- Custom landing pages with specialized sections
- Collection pages with SearchSpring integration
- Product pages with enhanced functionality
- Educational content and guides

**Custom Sections Available:**
- `main-collection-seo-content` - SEO-optimized collection content
- `company-features` - Brand-specific feature highlights
- `shop-the-look` - Product grouping displays
- `image-with-text` - Enhanced content blocks
- `specifications` - Technical specification displays

### Navigation Management
Each site maintains its own navigation structure:

**OneSource Navigation:**
- Main menu: Shop, Customer Care, Our Company, More Ways to Shop
- Utility menu: Announcement bar with promotional content

**FastServ Navigation:**
- Similar structure with FastServ-specific messaging
- Focus on "fast service" positioning

**Winzer Corp Navigation:**
- Corporate-focused messaging
- "Why Choose Winzer?" positioning

### Blog Management
**Current Blog Content:**
- **44 Blog Posts** across all sites
- **Content Focus:** Educational content, product guides, industry insights
- **SEO Strategy:** Rich content for organic search optimization
- **Content Examples:** Product tutorials, maintenance guides, industry news

Standard Shopify blog functionality with custom styling. Each site can maintain separate blog content for brand-specific messaging.

### SEO Content Management
**Collection SEO Fields (via metafields):**
- `collection.metafields.cql.seo_collection_tagline` - Collection descriptions
- `collection.metafields.cql.seo_collection_heading` - Custom headings
- `collection.metafields.cql.seo_collection_image` - Featured images

**Product SEO Fields:**
- Standard Shopify SEO fields
- Custom metafield integration for enhanced descriptions

**Content Structure (Combined Site Data):**

**OneSource Site:**
- **695 Products** across all categories and vendors
- **538 Smart Collections** with automated categorization
- **14 Custom Collections** for curated product groupings
- **39 Pages** including informational content and guides
- **44 Blog Posts** for SEO and customer education
- **47 Metaobjects** for structured content management
- **11 Menu structures** for site navigation

**FastServ Site:**
- **42,529 Products** (significantly larger inventory)
- **770 Smart Collections** with automated categorization
- **6 Custom Collections** for curated product groupings
- **14 Pages** including informational content and guides
- **3 Blog Posts** for SEO and customer education
- **7 Metaobjects** for structured content management
- **10 Menu structures** for site navigation

**Winzer Corp Site:**
- **48,718 Products** (largest inventory - 70x larger than OneSource)
- **535 Smart Collections** with automated categorization
- **3 Custom Collections** for curated product groupings
- **21 Pages** including informational content and guides
- **3 Blog Posts** for SEO and customer education
- **5 Metaobjects** for structured content management
- **10 Menu structures** for site navigation

---

## Product Management

### Product Data Standards
**Current Product Inventory:**

**OneSource Site:**
- **695 Total Products** with comprehensive metafield data
- **Major Categories:** Fasteners (227), Screws (41), Machine Screws (12), Bolts (38), Sockets (22)
- **Key Vendors:** Lenox, Loctite, Nucor, Permatex, WD-40, Kroil Lubricants
- **Product Types:** Hand tools, power tool accessories, fasteners, lubricants, adhesives

**FastServ Site:**
- **42,529 Total Products** (massive inventory - 61x larger than OneSource)
- **Product Types:** [To be analyzed from FastServ export data]
- **Categories:** [To be analyzed from FastServ export data]
- **Vendors:** [To be analyzed from FastServ export data]

**Winzer Corp Site:**
- **48,718 Total Products** (largest inventory - 70x larger than OneSource)
- **Product Types:** [To be analyzed from Winzer Corp export data]
- **Categories:** [To be analyzed from Winzer Corp export data]
- **Vendors:** [To be analyzed from Winzer Corp export data]

### Complete Metafield Documentation

**Metafield Usage Determination:**
- **Currently Used:** Metafields that appear in Liquid templates, JavaScript, SearchSpring code, or have populated data in exports
- **Code References:** Found in `main-product.liquid`, product templates, collection templates, and SearchSpring React components
- **Data Population:** Verified through Matrixify export analysis
- **SearchSpring Integration:** Critical for product filtering, display, and search functionality

#### Product-Level Metafields

**Core Product Information:**
- `cql.vendor_name` (single_line_text_field)
  - **Usage:** Displays vendor name on product pages and SearchSpring results
  - **Required:** No - displays fallback if blank
  - **Code Reference:** `product.metafields.cql.vendor_name` (Liquid), `mfield_cql_vendor_name` (SearchSpring)
  - **SearchSpring Usage:** Used in Result.js for vendor display in search results
  - **Purpose:** Brand/vendor identification

- `cql.features_text` (rich_text_field)
  - **Usage:** Product features section in collapsible tabs
  - **Required:** No - section hidden if blank
  - **Code Reference:** `product.metafields.cql.features_text | metafield_tag`
  - **Purpose:** Detailed product feature descriptions

- `cql.specs` (multi_line_text_field)
  - **Usage:** Technical specifications in collapsible tabs
  - **Required:** No - section hidden if blank
  - **Code Reference:** `product.metafields.cql.specs | metafield_tag`
  - **Purpose:** Technical specification details

- `cql.short_description` (multi_line_text_field)
  - **Usage:** Brief product description on product pages
  - **Required:** No - displays if available
  - **Code Reference:** `product.metafields.cql.short_description`
  - **Purpose:** Quick product overview

**Product Categorization:**
- `cql.categories` (list.single_line_text_field)
  - **Usage:** Smart collection rules and product categorization
  - **Required:** Yes - for proper collection assignment
  - **Code Reference:** Used in collection rules
  - **Purpose:** Automated product categorization

- `cql.category_hierarchy` (single_line_text_field)
  - **Usage:** Hierarchical category structure
  - **Required:** No - for advanced categorization
  - **Code Reference:** Used in collection rules
  - **Purpose:** Multi-level product organization

**Product Marketing:**
- `cql.product_badges` (list.single_line_text_field)
  - **Usage:** Promotional badges on product images and SearchSpring results
  - **Required:** No - badges only show if populated
  - **Code Reference:** `product.metafields.cql.product_badges.value.first` (Liquid), `mfield_cql_product_badges` (SearchSpring)
  - **SearchSpring Usage:** Used in Result.js and ResultRow.js for badge display in search results
  - **Purpose:** Visual promotional indicators

- `cql.promo_messaging` (single_line_text_field)
  - **Usage:** Promotional text on product pages and SearchSpring results
  - **Required:** No - only displays if populated
  - **Code Reference:** `product.metafields.cql.promo_messaging` (Liquid), `mfield_cql_promo_messaging` (SearchSpring)
  - **SearchSpring Usage:** Used in Result.js and ResultVariantRow.js for promotional messaging display
  - **Purpose:** Special offers and promotions

**Product Relationships:**
- `cql.metric_version` (product_reference)
  - **Usage:** Links to metric version of product
  - **Required:** No - for unit conversion
  - **Code Reference:** `product.metafields.cql.metric_version`
  - **Purpose:** Unit system product linking

- `cql.imperial_version` (product_reference)
  - **Usage:** Links to imperial version of product
  - **Required:** No - for unit conversion
  - **Code Reference:** `product.metafields.cql.imperial_version`
  - **Purpose:** Unit system product linking

- `cql.addon_product` (product_reference)
  - **Usage:** Associated addon products
  - **Required:** No - for product bundling
  - **Code Reference:** `product.metafields.cql.addon_product`
  - **Purpose:** Cross-selling and product recommendations

- `cql.associated_products` (product_reference)
  - **Usage:** Related product recommendations
  - **Required:** No - for product suggestions
  - **Code Reference:** `product.metafields.cql.associated_products`
  - **Purpose:** Enhanced product discovery

**Product Documentation:**
- `cql.documents` (single_line_text_field)
  - **Usage:** Product documentation links
  - **Required:** No - section hidden if blank
  - **Code Reference:** `product.metafields.cql.documents`
  - **Purpose:** Technical documentation access

**SEO and Marketing:**
- `title_tag` (string)
  - **Usage:** Custom page titles for SEO
  - **Required:** No - falls back to product title
  - **Code Reference:** Used in page head
  - **Purpose:** Search engine optimization

- `description_tag` (string)
  - **Usage:** Custom meta descriptions for SEO
  - **Required:** No - falls back to product description
  - **Code Reference:** Used in page head
  - **Purpose:** Search engine optimization

**Google Shopping:**
- `mm-google-shopping.custom_product` (boolean)
  - **Usage:** Google Shopping product classification
  - **Required:** No - for Google Shopping optimization
  - **Code Reference:** Used in Google Shopping feeds
  - **Purpose:** Enhanced Google Shopping visibility

- `mm-google-shopping.google_product_category` (single_line_text_field)
  - **Usage:** Google Shopping category classification
  - **Required:** No - for Google Shopping optimization
  - **Code Reference:** Used in Google Shopping feeds
  - **Purpose:** Proper Google Shopping categorization

#### Variant-Level Metafields

**Inventory Management:**
- `cql.minimum_order_quantity` (number_integer)
  - **Usage:** Sets minimum quantity for add to cart and SearchSpring variant display
  - **Required:** No - defaults to 1 if blank
  - **Code Reference:** `variant.metafields.cql.minimum_order_quantity` (Liquid), `cql_minimum_order_quantity` (SearchSpring)
  - **SearchSpring Usage:** Used in ResultVariantRow.js for sold-out threshold calculations
  - **Purpose:** Enforces minimum order requirements

- `cql.low_inventory_quantity` (number_integer)
  - **Usage:** Low stock warning thresholds in SearchSpring variant display
  - **Required:** No - for inventory alerts
  - **Code Reference:** `variant.metafields.cql.low_inventory_quantity` (Liquid), `cql_low_inventory_quantity` (SearchSpring)
  - **SearchSpring Usage:** Used in ResultVariantRow.js for low stock calculations and display
  - **Purpose:** Inventory management and customer alerts

**Product Information:**
- `cql.package_display` (single_line_text_field)
  - **Usage:** Package information display in SearchSpring results
  - **Required:** No - only shows if populated
  - **Code Reference:** `variant.metafields.cql.package_display` (Liquid), `mfield_cql_package_display` (SearchSpring)
  - **SearchSpring Usage:** Used in Result.js and ResultVariantRow.js for unit of measure display
  - **Purpose:** Package size and quantity information

- `cql.variant_description` (multi_line_text_field)
  - **Usage:** Variant-specific descriptions
  - **Required:** No - only shows if populated
  - **Code Reference:** `variant.metafields.cql.variant_description`
  - **Purpose:** Variant-specific product details

- `cql.winzer_uom` (single_line_text_field)
  - **Usage:** Unit of measure display
  - **Required:** No - only shows if populated
  - **Code Reference:** `variant.metafields.cql.winzer_uom`
  - **Purpose:** Unit of measure specification

**Marketing and Promotions:**
- `cql.promo_messaging` (single_line_text_field)
  - **Usage:** Variant-specific promotional text in SearchSpring results
  - **Required:** No - only shows if populated
  - **Code Reference:** `variant.metafields.cql.promo_messaging` (Liquid), `cql_promo_messaging` (SearchSpring)
  - **SearchSpring Usage:** Used in ResultVariantRow.js for variant-specific promotional messaging
  - **Purpose:** Variant-specific promotions

- `cql.top_seller` (boolean)
  - **Usage:** Best seller flag for variants
  - **Required:** No - for highlighting popular variants
  - **Code Reference:** `variant.metafields.cql.top_seller`
  - **Purpose:** Popular variant identification

**Product Specifications:**
- `cql.attributes_json` (json)
  - **Usage:** Technical specifications in JSON format for SearchSpring filtering
  - **Required:** Yes - Critical for SearchSpring filtered collection pages
  - **Code Reference:** `variant.metafields.cql.attributes_json.value` (Liquid), `mfield_cql_attributes_json` (SearchSpring)
  - **SearchSpring Usage:** Used in ResultRow.js for product filtering and facet matching
  - **Purpose:** Structured technical data for advanced filtering

**Safety and Compliance:**
- `cql.warning_badges` (single_line_text_field)
  - **Usage:** Safety warnings and compliance badges
  - **Required:** No - only shows if populated
  - **Code Reference:** `variant.metafields.cql.warning_badges`
  - **Purpose:** Safety and regulatory compliance

**Product Identification:**
- `cql.alternate_item_numbers` (single_line_text_field)
  - **Usage:** Alternative part numbers
  - **Required:** No - for cross-reference
  - **Code Reference:** `variant.metafields.cql.alternate_item_numbers`
  - **Purpose:** Part number cross-referencing

**Shipping Information:**
- `cql.product_lead_time` (number_integer)
  - **Usage:** Shipping timeframes in days for SearchSpring variant display
  - **Required:** No - only shows if populated
  - **Code Reference:** `variant.metafields.cql.product_lead_time` (Liquid), `cql_product_lead_time` (SearchSpring)
  - **SearchSpring Usage:** Used in ResultVariantRow.js for shipping timeframe display
  - **Purpose:** Customer shipping expectations

**Google Shopping Variant Data:**
- `mm-google-shopping.mpn` (single_line_text_field)
  - **Usage:** Manufacturer part number for Google Shopping
  - **Required:** No - for Google Shopping optimization
  - **Code Reference:** Used in Google Shopping feeds
  - **Purpose:** Google Shopping product identification

- `mm-google-shopping.size_type` (single_line_text_field)
  - **Usage:** Size type classification for Google Shopping
  - **Required:** No - for Google Shopping optimization
  - **Code Reference:** Used in Google Shopping feeds
  - **Purpose:** Google Shopping size categorization

- `mm-google-shopping.size_system` (single_line_text_field)
  - **Usage:** Size system classification for Google Shopping
  - **Required:** No - for Google Shopping optimization
  - **Code Reference:** Used in Google Shopping feeds
  - **Purpose:** Google Shopping size system specification

- `mm-google-shopping.custom_label_0` through `custom_label_4` (single_line_text_field)
  - **Usage:** Custom labels for Google Shopping campaigns
  - **Required:** No - for Google Shopping optimization
  - **Code Reference:** Used in Google Shopping feeds
  - **Purpose:** Google Shopping campaign organization

**System Integration:**
- `custom.oracle_id` (number_integer)
  - **Usage:** Oracle system integration
  - **Required:** Yes - for ERP integration
  - **Code Reference:** Used in system integrations
  - **Purpose:** Enterprise system synchronization

#### SearchSpring Critical Metafields

**Required for SearchSpring Functionality:**
- `cql.attributes_json` (variant-level) - **CRITICAL** for filtered collection pages
  - **Why Required:** SearchSpring uses this field to match products against filter criteria
  - **Impact if Missing:** Products won't appear in filtered search results
  - **Data Format:** JSON object with key-value pairs for technical specifications
  - **Example:** `{"Material": "Steel", "Finish": "Zinc Plated", "Thread Size": "M8"}`

**SearchSpring Display Metafields:**
- `cql.vendor_name` (product-level) - Vendor display in search results
- `cql.product_badges` (product-level) - Promotional badges in search results  
- `cql.promo_messaging` (product/variant-level) - Promotional text in search results
- `cql.package_display` (variant-level) - Unit of measure in search results
- `cql.minimum_order_quantity` (variant-level) - MOQ calculations for sold-out status
- `cql.low_inventory_quantity` (variant-level) - Low stock warnings in search results
- `cql.product_lead_time` (variant-level) - Shipping timeframes in search results

**SearchSpring Integration Notes:**
- Metafields are prefixed with `mfield_cql_` in SearchSpring data
- Variant metafields are accessed directly by field name in SearchSpring components
- The `attributes_json` field is parsed and used for dynamic filtering logic
- Missing critical metafields will cause products to be excluded from filtered results

### Collection Management
**Current Collection Structure:**

**OneSource Site:**
- **538 Smart Collections** with automated rules based on metafields
- **14 Custom Collections** for curated product groupings
- **Primary Categories:** Fasteners, Screws, Machine Screws, Bolts, Sockets, Socket Cap Screws
- **Vendor Collections:** Lenox, Loctite, Nucor, Permatex, WD-40, Kroil Lubricants
- **Featured Collections:** Best Sellers (22 products), Home page collection

**FastServ Site:**
- **770 Smart Collections** with automated rules based on metafields
- **6 Custom Collections** for curated product groupings
- **Categories:** [To be analyzed from FastServ export data]
- **Vendor Collections:** [To be analyzed from FastServ export data]

**Winzer Corp Site:**
- **535 Smart Collections** with automated rules based on metafields
- **3 Custom Collections** for curated product groupings
- **Categories:** [To be analyzed from Winzer Corp export data]
- **Vendor Collections:** [To be analyzed from Winzer Corp export data]

**Collection Metafields (Currently Used):**
- `custom.collection_parent_category` - Category hierarchy (collection reference)
- `cql.seo_collection_tagline` - SEO descriptions (multi-line text)
- `cql.seo_collection_heading` - Custom headings (single-line text)
- `cql.seo_collection_image` - Featured images (file reference)
- `title_tag` & `description_tag` - SEO metadata
- `custom.test` - Test collection references (list)

**Smart Collection Rules:**
- Based on `cql.categories` metafield matching specific values
- Examples: "Fasteners" (227 products), "Screws" (41 products), "Machine Screws" (12 products)
- Automatic product assignment based on metafield data

### Product Import/Export
**Matrixify Integration:**
- Use Matrixify for bulk product imports/exports
- Maintain metafield data integrity during imports
- Daily product backups currently configured
- **Export includes:** Products, Collections, Pages, Blog Posts, Menus, Metaobjects
- **Metafield coverage:** All CQL custom metafields included in exports
- **Data integrity:** Full variant and inventory data preserved

**Current Export Data:**

**OneSource Site:**
- **Products:** 6,327 rows (695 products with variants)
- **Collections:** 552 rows (538 smart + 14 custom)
- **Pages:** 3,137 rows (39 pages + content and related data)
- **Blog Posts:** 4,437 rows (44 blog posts + comments and related data)
- **Menus:** 97 rows (navigation structures)
- **Metaobjects:** 46 rows (structured content)

**FastServ Site:**
- **Products:** 50,811 rows (42,529 products with variants)
- **Collections:** 777 rows (770 smart + 6 custom)
- **Pages:** 2,994 rows (14 pages + content and related data)
- **Blog Posts:** 441 rows (3 blog posts + comments and related data)
- **Menus:** 96 rows (navigation structures)
- **Metaobjects:** 21 rows (structured content)

**Winzer Corp Site:**
- **Products:** 56,954 rows (48,718 products with variants)
- **Collections:** 538 rows (535 smart + 3 custom)
- **Pages:** 195 rows (21 pages + content and related data)
- **Blog Posts:** 441 rows (3 blog posts + comments and related data)
- **Menus:** 98 rows (navigation structures)
- **Metaobjects:** 17 rows (structured content)

### Product Variants
- Support for complex variant structures
- Dynamic variant switching with SearchSpring
- Color/material variant grouping
- Package size variations

### SEO for Products
- Standard Shopify SEO fields
- Custom metafield integration for enhanced descriptions
- SearchSpring-powered search optimization
- Collection-level SEO content management

---

## Site Management

### Theme Management
**Development Workflow:**
1. Local development using Node.js build system
2. Staging theme deployment for testing
3. Production deployment via ThemeKit

**Available Commands:**
```bash
# Build and deploy
npm run [site]:build
npm run [site]:deploy

# Development
npm run [site]:watch
npm run [site]:ss-dev

# Theme management
npm run [site]:list
npm run [site]:open
```

**Sites:** `onesource`, `fastserv`, `corp`

### App Inventory

| App Name         | Purpose             | Configuration                  | Notes                                     |
| ---------------- | ------------------- | ------------------------------ | ----------------------------------------- |
| **SearchSpring** | Search & Filtering  | Site-specific configurations   | Custom React components, dynamic variants |
| **Klaviyo**      | Email Marketing     | Onsite tracking enabled        | OneSource only                            |
| **Elevar**       | Conversion Tracking | DataLayer integration          | All sites                                 |
| **Matrixify**    | Data Import/Export  | [Insert configuration details] | [Insert Winzer-specific settings]         |

### SearchSpring Configuration
**Site IDs:**
- OneSource: `t047mf`
- FastServ: `wk4j0d`
- Winzer Corp: `fsqw40`

**Key Features:**
- Dynamic variant switching
- Custom search components
- Advanced filtering
- Recommendation engines
- Autocomplete functionality

### Shopify Plus Features
- **Checkout Extensions:** Custom checkout branding
- **Scripts:** [Insert any custom checkout scripts]
- **Flow:** [Insert any Flow automations]
- **Launchpad:** [Insert any scheduled campaigns]

### Domain Management
- Primary domains: [Insert actual domain names]
- SSL certificates managed through Shopify
- CDN optimization enabled

---

## Custom Elements

### Custom Sections
**Product-Specific Sections:**
- `main-product` - Enhanced product page with metafield integration
- `product-specifications` - Technical specification displays
- `product-downloads` - Document management
- `bulk-pricing-table` - Volume pricing displays

**Collection-Specific Sections:**
- `main-collection-banner` - Custom collection headers
- `main-collection-product-grid` - SearchSpring-powered product grids
- `filter-helpers` - Color/material filtering

**Content Sections:**
- `company-features` - Brand feature highlights
- `shop-the-look` - Product grouping
- `image-with-text` - Enhanced content blocks
- `specifications` - Technical displays

### Custom JavaScript
**Key Functionality:**
- Dynamic variant switching with metafield integration
- SearchSpring integration and customization
- Pricing API integration for exact pricing
- Cart functionality enhancements
- Modal and drawer interactions

**Custom Components:**
- `HeaderDrawer` - Mobile navigation
- `ModalDialog` - Popup functionality
- `DetailsModal` - Expandable content
- SearchSpring React components

### Custom CSS
**Site-Specific Styling:**
- Brand color schemes per site
- Custom animations and transitions
- Responsive design enhancements
- SearchSpring component styling

**CSS Architecture:**
- Base styles in `base.css`
- Component-specific stylesheets
- Site-specific overrides in individual site directories

### Metafield Usage
**Product Metafields:**
- Technical specifications and features
- Vendor and brand information
- Inventory and shipping data
- Promotional content and badges

**Collection Metafields:**
- SEO content and descriptions
- Category hierarchy
- Featured images and content

**Variant Metafields:**
- Order quantities and lead times
- Package information
- Promotional messaging
- Inventory thresholds

---

## Operations

### Backup Strategy
- **Theme Backups:** Automatic via Shopify Plus
- **Data Backups:** Matrixify exports recommended monthly (currently exporting product backups daily)
- **Code Backups:** Git repository maintained by CQL Corp
- **Image Backups:** Managed through Shopify's CDN

### Monitoring
**Performance Monitoring:**
- Core Web Vitals tracking
- SearchSpring performance metrics
- Site speed monitoring

**Uptime Monitoring:**
- [Insert monitoring service details]
- Alert thresholds: [Insert specific metrics]

### Security
- **SSL:** Managed through Shopify
- **Access Control:** Role-based permissions
- **Data Protection:** GDPR compliance through Shopify
- **Payment Security:** PCI compliance via Shopify Payments

### Maintenance Schedule
**Daily:**
- Monitor site performance
- Check for order issues
- Review customer service tickets

**Weekly:**
- Update product information
- Review search performance
- Check app functionality

**Monthly:**
- Full site backup via Matrixify
- Performance review
- Security audit
- Content updates

### Troubleshooting
**Common Issues:**
1. **SearchSpring not loading:** Check site ID configuration
2. **Metafields not displaying:** Verify metafield namespace and key
3. **Custom sections not working:** Check for syntax errors in Liquid
4. **Performance issues:** Review SearchSpring configuration

**Escalation Process:**
1. Check Shopify status page
2. Review recent changes
3. Contact CQL Corp for code-related issues
4. Contact SearchSpring for search-related issues

### User Permissions
**Recommended Roles:**
- **Store Owner:** Full access
- **Manager:** Content and product management
- **Staff:** Order and customer management
- **Developer:** Theme and app access (CQL Corp)

---

## Documentation Sources

### Primary Data Sources
This documentation was compiled from the following sources:

**1. Winzer Theme Codebase Analysis**
- **Source:** `/winzer-main/` directory structure and files
- **Analysis Date:** September 24, 2025
- **Key Files Analyzed:**
  - `sites/_shared/` - Core shared functionality across all sites
  - `sites/onesource/` - OneSource-specific customizations
  - `sites/corp/` - Corporate site customizations  
  - `sites/fastserv/` - FastServ site customizations
  - `searchspring/winzer/` - SearchSpring integration code
  - `dawn/` - Base Dawn theme (Shopify's source theme)

**2. Matrixify Export Data**

**OneSource Site Export:**
- **Export File:** `EVERYTHING-Export_2025-09-24_115603.zip`
- **Export Date:** September 24, 2025, 11:56:03 AM -0400
- **Source Store:** winzeronesource.myshopify.com
- **Export Duration:** 3 minutes 36 seconds

**FastServ Site Export:**
- **Export File:** `fastserv-EVERYTHING-Export_2025-09-24_121740.zip`
- **Export Date:** September 24, 2025, 12:17:40 PM -0400
- **Source Store:** winzerfastserv.myshopify.com
- **Export Duration:** 53 minutes 12 seconds

**Winzer Corp Site Export:**
- **Export File:** `winzer-EVERYTHING-Export_2025-09-24_121626.zip`
- **Export Date:** September 24, 2025, 12:16:26 PM -0400
- **Source Store:** winzercorp.myshopify.com
- **Export Duration:** 1 hour 3 minutes 36 seconds

**Data Files Analyzed:**
- **OneSource:** Products (6,327 rows), Collections (552 rows), Pages (3,138 rows), Blog Posts (4,438 rows), Menus (98 rows), Metaobjects (47 rows)
- **FastServ:** Products (50,811 rows), Collections (777 rows), Pages (2,994 rows), Blog Posts (441 rows), Menus (96 rows), Metaobjects (21 rows)
- **Winzer Corp:** Products (56,954 rows), Collections (538 rows), Pages (195 rows), Blog Posts (441 rows), Menus (98 rows), Metaobjects (17 rows)

**3. Site Configuration Analysis**
- **Settings Files:** `settings_data.json` for each site
- **Template Files:** Product and collection template configurations
- **Metafield Usage:** Analysis of 20+ custom metafields across products and collections
- **App Integration:** SearchSpring, Klaviyo, Elevar configuration analysis

### Technical Analysis Methods

**Code Structure Analysis:**
- Multi-site architecture pattern identification
- Custom section and snippet inventory
- JavaScript functionality mapping
- CSS customization documentation
- Metafield usage pattern analysis

**Data Inventory Analysis:**
- Product categorization and vendor analysis
- Collection structure and automation rules
- Content volume and type assessment
- SEO metadata usage patterns
- Navigation structure mapping

**Integration Analysis:**
- SearchSpring configuration and custom components
- App installation and configuration status
- Custom JavaScript functionality
- Theme customization scope

### Data Validation
- **Cross-referenced** metafield usage between code and export data
- **Verified** app configurations against codebase
- **Confirmed** site-specific customizations and shared functionality
- **Validated** collection rules against actual product data

### Limitations
- **Snapshot Data:** All exports represent point-in-time data as of September 24, 2025
- **Code Analysis:** Based on current codebase state, may not reflect all historical customizations
- **Data Analysis:** Detailed product categorization and vendor analysis pending for FastServ and Winzer Corp sites

### Future Updates
This documentation should be updated when:
- New products or collections are added
- Metafield structures are modified
- App configurations change
- Custom code is updated
- Site architecture changes

---

## Contact Information

**CQL Corp (Technical Support):**
- [Insert contact details]

**SearchSpring Support:**
- [Insert contact details]

**Shopify Plus Support:**
- Available through admin panel

**Arcadia Digital (Transition Support):**
- [Insert contact details for 30-day transition period]

---

## Appendices

### A. Metafield Reference
[Detailed metafield definitions and usage examples]

### B. Custom Section Documentation
[Complete list of custom sections and their configurations]

### C. SearchSpring Configuration
[Detailed SearchSpring setup and customization guide]

### D. Emergency Procedures
[Step-by-step emergency response procedures]

---

*This document serves as the foundation for Winzer's eCommerce operations. Regular updates should be made as the platform evolves and new features are added.*

**Document Version:** 1.0  
**Last Updated:** [Current Date]  
**Next Review:** [Date + 3 months]
