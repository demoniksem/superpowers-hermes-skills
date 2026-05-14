# Frontend Design Plugin (Claude Code)

**Source:** https://github.com/anthropics/claude-code/tree/main/plugins/frontend-design

## Purpose

Create distinctive, production-grade frontend interfaces that avoid "generic AI slop" aesthetics.

## When to Use

Load this skill during brainstorming when the user wants to build:
- Web components, pages, or applications
- Landing pages, dashboards, settings panels
- Any frontend UI work

## Core Design Philosophy

**Before coding** — commit to a BOLD aesthetic direction:
- **Purpose**: What problem does this solve? Who uses it?
- **Tone**: Pick an extreme — brutal minimalism, maximalist chaos, retro-futuristic, organic/natural, luxury/refined, playful/toy-like, editorial/magazine, brutalist/raw, art deco/geometric, soft/pastel, industrial/utilitarian
- **Constraints**: Framework, performance, accessibility
- **Differentiation**: What's the ONE memorable thing?

## Design Guidelines

| Aspect | Do | Don't |
|--------|-----|-------|
| **Typography** | Distinctive, characterful fonts | Inter, Roboto, Arial, system fonts |
| **Color** | Cohesive aesthetic with sharp accents | Purple gradients on white (overused) |
| **Motion** | High-impact moments, staggered reveals | Scattered micro-interactions |
| **Layout** | Asymmetry, overlap, diagonal flow | Predictable grid patterns |
| **Background** | Atmosphere, depth, textures, noise | Solid flat colors |

## Key Principle

> "Choose a clear conceptual direction and execute it with precision. Bold maximalism and refined minimalism both work — the key is intentionality, not intensity."

## Integration with Brainstorming

```
brainstorming (with frontend design intent)
       ↓
  Load frontend-design principles
       ↓
  Explore context + design direction
       ↓
  writing-plans
```

When user describes a frontend project, incorporate these design principles into the brainstorming session's design proposal phase.

## What to Avoid

- Space Grotesk (overused in AI-generated code)
- Generic font families
- Purple gradients on white
- Cookie-cutter layouts
- "AI slop" aesthetics

## Example Usage

User: "Create a dashboard for a music streaming app"

1. Load this reference
2. During brainstorming design phase — propose a distinctive aesthetic (e.g., "dark vinyl-inspired with amber accents, editorial typography")
3. Apply in implementation via writing-plans

## Streamlit-Specific Pitfalls (2026-05-08)

When the frontend project is a Streamlit dashboard, additional constraints apply beyond normal web development.

### `pages` dict defined AFTER navigation code → `UnboundLocalError`

Streamlit evaluates the entire script on every rerun. If your page routing code references a `pages` dict before that dict is defined in the script, Python raises `UnboundLocalError`. Result: **7+ of 11 pages render completely blank**, only sidebar + banner shows.

**FIX:** Always define the `pages` dict at the TOP of `main()`, before any routing logic.

### Auto-refresh blocking (`time.sleep` + `st.rerun()`)

```python
# BROKEN — blocks page for entire sleep duration, causes UI "dimming"
time.sleep(st.session_state.refresh_interval)
st.rerun()

# FIX: Disable auto-refresh by default. If needed, use @st.fragment decorator.
defaults = {"auto_refresh": False, ...}
```

### `st.rerun(scope="fragment")` only valid inside `@st.fragment`

Using `scope="fragment"` outside a `@st.fragment` decorated function crashes Streamlit. Use plain `st.rerun()` without arguments at top level.

### HTML `<a href>` in sidebar doesn't SPA-route

```python
# BROKEN — URL changes but Streamlit doesn't re-render
st.markdown(f'<a href="?page={link}"><div class="sidebar-link">{link}</div></a>', unsafe_allow_html=True)
```

Use Streamlit native widgets for navigation (selectbox, radio, or st.page_link in 1.75+).

### Duplicate widget keys crash Streamlit 1.57+

```python
# CRASHES — cannot use both value= and key= pointing to same session_state key
st.checkbox("Auto-refresh", value=st.session_state.auto_refresh, key="auto_refresh")

# FIX — use value= without key= (Streamlit auto-generates key)
st.checkbox("Auto-refresh", value=st.session_state.auto_refresh)
```

### Plotly `paper_bgcolor="transparent"` ignored

Plotly rejects the string `"transparent"` for background colors. Use `rgba(0,0,0,0)` instead.

### Query params + auto-refresh = page reset loop

Every `st.rerun()` resets `st.query_params` to defaults. If you navigate via `?page=XXX` and auto-refresh is on, the page resets to default on every refresh cycle. Keep auto-refresh OFF for query-param navigation.