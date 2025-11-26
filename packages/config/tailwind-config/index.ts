import type { Config } from "tailwindcss";

const config: Config = {
  darkMode: ["class"],
  content: [
    "./pages/**/*.{ts,tsx}",
    "./components/**/*.{ts,tsx}",
    "./app/**/*.{ts,tsx}",
    "./src/**/*.{ts,tsx}",
    "../../packages/ui/**/*.{ts,tsx}",
  ],
  theme: {
    container: {
      center: true,
      padding: "2rem",
      screens: {
        "2xl": "1400px",
      },
    },
    extend: {
      colors: {
        primary: {
          50: "#e6f7ff",
          100: "#b3e6ff",
          200: "#80d4ff",
          300: "#4dc2ff",
          400: "#1ab0ff",
          500: "#00ade8",
          600: "#008bb8",
          700: "#006988",
          800: "#004758",
          900: "#002528",
          DEFAULT: "#00ade8",
          foreground: "#ffffff",
        },
        slate: {
          50: "#f8fafc",
          100: "#f1f5f9",
          200: "#e2e8f0",
          300: "#cbd5e1",
          400: "#94a3b8",
          500: "#64748b",
          600: "#475569",
          700: "#334155",
          800: "#1e293b",
          850: "#1a1f28",
          900: "#0f172a",
          950: "#0a0d14",
        },
        background: "#0a0d14",
        foreground: "#cbd5e1",
        card: {
          DEFAULT: "#1e293b",
          foreground: "#cbd5e1",
        },
        popover: {
          DEFAULT: "#1e293b",
          foreground: "#cbd5e1",
        },
        muted: {
          DEFAULT: "#334155",
          foreground: "#94a3b8",
        },
        accent: {
          DEFAULT: "#334155",
          foreground: "#cbd5e1",
        },
        destructive: {
          DEFAULT: "#ef4444",
          foreground: "#ffffff",
        },
        border: "hsl(215 16% 47% / 0.3)",
        input: "hsl(215 16% 47% / 0.3)",
        ring: "#00ade8",
      },
      fontFamily: {
        display: ['Montserrat', 'sans-serif'],
        body: ['Inter', 'system-ui', 'sans-serif'],
        sans: ['Inter', 'system-ui', 'sans-serif'],
      },
      fontSize: {
        xs: ["12px", { lineHeight: "1.5" }],
        sm: ["14px", { lineHeight: "1.5" }],
        base: ["16px", { lineHeight: "1.625" }],
        lg: ["18px", { lineHeight: "1.625" }],
        xl: ["20px", { lineHeight: "1.5" }],
        "2xl": ["24px", { lineHeight: "1.375" }],
        "3xl": ["30px", { lineHeight: "1.25" }],
        "4xl": ["36px", { lineHeight: "1.25" }],
        "5xl": ["48px", { lineHeight: "1.25" }],
        "6xl": ["64px", { lineHeight: "1.0" }],
      },
      spacing: {
        section: "80px",
        card: "32px",
        element: "24px",
      },
      borderRadius: {
        lg: "12px",
        md: "8px",
        sm: "4px",
        card: "16px",
        button: "12px",
        input: "8px",
      },
      keyframes: {
        "fade-in": {
          "0%": { opacity: "0" },
          "100%": { opacity: "1" },
        },
        "slide-up": {
          "0%": { opacity: "0", transform: "translateY(20px)" },
          "100%": { opacity: "1", transform: "translateY(0)" },
        },
        "accordion-down": {
          from: { height: "0" },
          to: { height: "var(--radix-accordion-content-height)" },
        },
        "accordion-up": {
          from: { height: "var(--radix-accordion-content-height)" },
          to: { height: "0" },
        },
      },
      animation: {
        "fade-in": "fade-in 0.6s ease-out",
        "slide-up": "slide-up 0.6s ease-out",
        "accordion-down": "accordion-down 0.2s ease-out",
        "accordion-up": "accordion-up 0.2s ease-out",
      },
    },
  },
  plugins: [
    require("tailwindcss-animate"),
    require("@tailwindcss/typography"),
  ],
};

export default config;

