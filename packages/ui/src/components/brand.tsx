import * as React from "react";
import { cn } from "../lib/utils";

interface BrandProps extends React.HTMLAttributes<HTMLSpanElement> {
  name: string;
  size?: "sm" | "md" | "lg" | "xl";
}

const sizeClasses = {
  sm: "text-base",
  md: "text-xl",
  lg: "text-2xl",
  xl: "text-4xl",
};

/**
 * Brand component with wordmark formatting
 * Example: <Brand name="bekaa" /> renders "bekaa."
 * The dot is always in primary color
 */
const Brand = React.forwardRef<HTMLSpanElement, BrandProps>(
  ({ name, size = "md", className, ...props }, ref) => {
    return (
      <span
        ref={ref}
        className={cn(
          "nowrap font-display font-medium tracking-tight",
          sizeClasses[size],
          className
        )}
        {...props}
      >
        {name}
        <span className="text-primary-500 font-bold">.</span>
      </span>
    );
  }
);
Brand.displayName = "Brand";

export { Brand };

