# Memento App - Design Style Guide

## Design Philosophy

### Color Palette
- **Primary**: Sage Green (#87A96B) - Trust, growth, and natural connection
- **Secondary**: Warm Charcoal (#4A4A4A) - Professional, sophisticated
- **Accent**: Soft Gold (#D4AF37) - Achievement and premium feel
- **Background**: Off-white (#FAFAFA) - Clean, accessible
- **Text**: Deep Charcoal (#2C2C2C) - High contrast readability
- **Subtle**: Light Gray (#E8E8E8) - Borders and subtle elements

### Typography
- **Display Font**: "Playfair Display" - Elegant serif for headings and hero text
- **Body Font**: "Inter" - Clean, modern sans-serif for readability
- **Monospace**: "JetBrains Mono" - For data and technical elements

### Visual Language
- **Minimalist Elegance**: Clean layouts with purposeful white space
- **Organic Connections**: Subtle curved lines and rounded corners
- **Professional Warmth**: Balancing business functionality with human approachability
- **Data-Driven Clarity**: Clear hierarchy and information architecture

## Visual Effects & Styling

### Used Libraries
- **Anime.js**: Smooth micro-interactions and state transitions
- **ECharts.js**: Data visualization for statistics and progress tracking
- **Splide.js**: Image carousels for avatar galleries
- **p5.js**: Creative background effects and network visualizations
- **Pixi.js**: Advanced visual effects for achievement animations

### Animation & Effects
- **Subtle Fade-ins**: Content appears with gentle opacity transitions
- **Hover Transformations**: Cards lift with soft shadows on interaction
- **Progress Animations**: Achievement bars fill with satisfying easing
- **Network Visualization**: Interactive node graphs showing connections
- **Particle Systems**: Celebratory effects for achievement unlocking

### Header & Navigation Effects
- **Floating Navigation**: Semi-transparent header with backdrop blur
- **Smooth Scrolling**: Momentum-based scroll behavior
- **Active State Indicators**: Subtle underlines and color shifts
- **Responsive Collapse**: Mobile-friendly hamburger menu

### Card & Component Styling
- **Soft Shadows**: Multi-layer shadows for depth without harshness
- **Rounded Corners**: 8px radius for modern, friendly appearance
- **Gradient Overlays**: Subtle gradients on interactive elements
- **Micro-interactions**: Button press feedback and form validation

### Background & Layout
- **Consistent Background**: Single background maintained across all sections
- **Grid System**: 12-column responsive grid with consistent gutters
- **Vertical Rhythm**: 24px baseline grid for text and elements
- **Responsive Breakpoints**: Mobile-first design with fluid scaling

### Data Visualization Style
- **Monochromatic Variations**: Using tints and shades of primary colors
- **Subtle Animations**: Data points animate in with staggered timing
- **Interactive Tooltips**: Contextual information on hover/touch
- **Accessible Colors**: WCAG AA compliant contrast ratios

### Interactive Elements
- **Button States**: Clear hover, active, and disabled states
- **Form Validation**: Real-time feedback with color and icon indicators
- **Loading States**: Skeleton screens and progress indicators
- **Error Handling**: Friendly error messages with recovery suggestions

### Mobile Considerations
- **Touch Targets**: Minimum 44px touch areas for accessibility
- **Gesture Support**: Swipe navigation and pull-to-refresh
- **Performance**: Optimized animations and lazy loading
- **Offline States**: Graceful degradation when connectivity is limited

## Component Specifications

### Contact Cards
- **Dimensions**: 280px width, variable height
- **Image Treatment**: Circular avatars with subtle border
- **Typography Hierarchy**: Name (18px), context (14px), details (12px)
- **Color Coding**: Label badges with consistent color mapping

### Search Interface
- **Input Field**: Large, prominent search with clear button
- **Filter Chips**: Rounded tags with remove functionality
- **Results Display**: Instant search with highlighted matches
- **Empty States**: Helpful suggestions when no results found

### Achievement System
- **Badge Design**: Circular medals with gradient backgrounds
- **Progress Bars**: Animated fills with milestone markers
- **Celebration Effects**: Particle bursts and sound notifications
- **Social Sharing**: Pre-designed sharing cards

### Data Export/Import
- **File Interface**: Drag-and-drop zones with visual feedback
- **Progress Tracking**: Step-by-step wizard with completion indicators
- **Validation States**: Clear success/error messaging
- **Security Indicators**: Encryption and privacy assurance visuals