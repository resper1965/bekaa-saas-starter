# Bekaa Design System

Design System baseado em shadcn/ui, customizado para a filosofia Bekaa: **"Invisível quando funciona, Presente quando importa"**.

## Cores

### Primary (Azul Bekaa)

```css
primary-500: #00ade8  /* Base */
primary-600: #008bb8
primary-400: #1ab0ff
```

### Slate (Neutros)

```css
slate-950: #0a0d14  /* Background principal */
slate-900: #0f172a
slate-800: #1e293b  /* Cards */
slate-700: #334155
slate-300: #cbd5e1  /* Texto principal */
slate-400: #94a3b8  /* Texto secundário */
```

## Tipografia

### Fontes

- **Display**: Montserrat (títulos, headings)
- **Body**: Inter (texto, parágrafos)

### Tamanhos

```css
xs: 12px / 1.5
sm: 14px / 1.5
base: 16px / 1.625
lg: 18px / 1.625
xl: 20px / 1.5
2xl: 24px / 1.375
3xl: 30px / 1.25
4xl: 36px / 1.25
5xl: 48px / 1.25
```

## Componentes

### Button

```tsx
import { Button } from '@bekaa/ui';

<Button variant="primary" size="lg">
  Começar Agora
</Button>
```

Variantes:
- `primary` - Gradiente azul com hover
- `secondary` - Borda transparente
- `ghost` - Sem background
- `destructive` - Vermelho para ações destrutivas

### Card

```tsx
import { Card, CardHeader, CardTitle, CardContent } from '@bekaa/ui';

<Card>
  <CardHeader>
    <CardTitle>Título</CardTitle>
  </CardHeader>
  <CardContent>
    Conteúdo
  </CardContent>
</Card>
```

### Brand

```tsx
import { Brand } from '@bekaa/ui';

<Brand name="bekaa" size="xl" />
// Renderiza: "bekaa." (com ponto azul)
```

## Espaçamento

```css
section: 80px  /* Entre seções */
card: 32px     /* Padding de cards */
element: 24px  /* Entre elementos */
```

## Border Radius

```css
card: 16px
button: 12px
input: 8px
```

## Animações

```css
fade-in: 0.6s ease-out
slide-up: 0.6s ease-out
```

Respeita `prefers-reduced-motion` automaticamente.

## Uso

### No Tailwind Config

```typescript
import bekaaTheme from '@bekaa/config/tailwind-config';

export default bekaaTheme;
```

### Nos Componentes

```tsx
import { Button, Card, Brand } from '@bekaa/ui';
```

## Princípios

1. **Discreto quando funciona** - Backgrounds escuros, texto suave
2. **Presente quando importa** - CTAs destacados, informações claras
3. **Simplicidade sofisticada** - Menos é mais, mas com propósito
4. **Informação organizada** - Muito conteúdo, mas respirável

