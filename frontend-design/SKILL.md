---
name: frontend-design
description: "Use when building web components, pages, or applications — creates distinctive, production-grade frontend interfaces avoiding generic AI aesthetics."
related_skills: [brainstorming, writing-plans]
---

# Frontend Design

See `references/frontend-design-plugin.md` for the original Claude Code plugin documentation and detailed design guidelines.

## Taste Skill Integration

For **detailed design rules, anti-slop patterns, and premium UI constraints**, consult these skill files from the taste-skill collection:

| File | Purpose |
|------|---------|
| `taste-skill/SKILL.md` | Core design rules — typography, color, layout, motion, 10-section creative arsenal |
| `taste-skill/soft-skill.md` | Awwwards-tier UI — haptic aesthetics, nested architecture, premium motion |
| `taste-skill/minimalist-skill.md` | Editorial/Linear/Notion vibes |
| `taste-skill/output-skill.md` | Anti-truncation — forces full output, no placeholder comments |

**Usage pattern:**
1. After `brainstorming` design is approved
2. Before `writing-plans`, invoke `frontend-design`
3. Load relevant taste-skill file(s) for design rules matching the aesthetic direction
4. Apply those rules in combination with the guidelines below

Create distinctive, production-grade frontend interfaces with high design quality. Generate creative, polished code that avoids generic "AI slop" aesthetics.

**Trigger:** After `brainstorming` design approved, before `writing-plans` for any frontend task.

## Design Thinking

Before coding, understand context and commit to a **BOLD aesthetic direction**:

- **Purpose**: What problem does this interface solve? Who uses it?
- **Tone**: Pick an extreme — brutally minimal, maximalist chaos, retro-futuristic, organic/natural, luxury/refined, playful/toy-like, editorial/magazine, brutalist/raw, art deco/geometric, soft/pastel, industrial/utilitarian, etc.
- **Constraints**: Technical requirements (framework, performance, accessibility).
- **Differentiation**: What makes this UNFORGETTABLE? One thing someone will remember?

**CRITICAL:** Choose a clear conceptual direction and execute with precision. Bold maximalism and refined minimalism both work — key is intentionality.

## Implementation Guidelines

### Typography
- Choose fonts that are beautiful, unique, characterful
- **Avoid:** Inter, Roboto, Arial, system-ui defaults
- **Prefer:** Distinctive display fonts + refined body fonts
- Pair unexpected combinations

### Color & Theme
- Commit to cohesive aesthetic
- Use CSS variables for consistency
- Dominant colors with sharp accents > timid evenly-distributed palettes
- Vary between light and dark themes per project

### Motion
- Animations for effects and micro-interactions
- Prioritize CSS-only solutions where possible
- High-impact moments: one well-orchestrated page load with staggered reveals (animation-delay) creates more delight than scattered micro-interactions
- Use scroll-triggering and hover states that surprise

### Spatial Composition
- Unexpected layouts
- Asymmetry, overlap, diagonal flow
- Grid-breaking elements
- Generous negative space OR controlled density

### Backgrounds & Visual Details
- Create atmosphere and depth — not solid colors
- Add contextual effects: gradient meshes, noise textures, geometric patterns, layered transparencies
- Dramatic shadows, decorative borders, custom cursors, grain overlays

## Forbidden Aesthetics

**NEVER use:**
- Overused fonts: Inter, Roboto, Arial, Space Grotesk
- Purple gradients on white backgrounds
- Predictable layouts and component patterns
- Cookie-cutter design lacking context-specific character

## Code Quality

Implement production-grade working code (HTML/CSS/JS, React, Vue, etc.):
- Visually striking and memorable
- Cohesive with clear aesthetic point-of-view
- Meticulously refined in every detail
- Match implementation complexity to aesthetic vision

**Maximalist designs** → elaborate code with extensive animations and effects

**Minimalist/refined designs** → restraint, precision, careful spacing, subtle details

## Reference App Inspection Workflow

When asked to replicate a dashboard/UI from a live reference URL (e.g. "build this for Hermes"):

**CRITICAL: Explore freely, change nothing.**
> "Go to this URL but don't change or press anything, except for the left menu."

1. **Navigate to the URL** — open in browser
2. **Explore via sidebar navigation ONLY** — click sidebar menu items to see all pages, take snapshots
3. **Document each page:**
   - `browser_snapshot()` for DOM structure
   - `browser_console()` for JS errors (after each navigation)
   - `browser_vision()` with `annotate=true` for element layout
4. **Do NOT interact with forms, buttons, inputs, dropdowns** — just observe
5. **After full exploration** — build the equivalent in the target platform
6. **Test the rebuild** against the original: same pages, same sections, same data patterns

**This pattern avoids:**
- Accidentally modifying live systems
- Wasting time documenting interactive elements you'll rebuild anyway
- Missing pages that are only accessible via sidebar

## Streamlit Pitfalls

When building dashboards or web UIs with Streamlit, avoid these common traps:

### Duplicate widget key + session state (Streamlit 1.57+)

**WRONG — crashes at startup:**
```python
st.checkbox("Auto-refresh", value=st.session_state.auto_refresh, key="auto_refresh")
st.slider("Interval (s)", 1, 10, st.session_state.refresh_interval, key="refresh_interval")
```

**WHY IT CRASHES:** Streamlit 1.57+ checks widget policies and throws when you pass both `value=` (which sets an initial default) and `key=` (which implies manual session state management). The error: `"The widget with key 'X' was created with a default value but also had its value set via the Session State API."`

**CORRECT — use session state for persistence, no key:**
```python
st.checkbox("Auto-refresh", value=st.session_state.auto_refresh)
st.slider("Interval (s)", 1, 10, st.session_state.refresh_interval)
```
Streamlit auto-generates a key from the label, and the `value=` initialises from session_state. This works correctly with auto-rerun.

**Alternative — use unique keys without value:**
```python
if "auto_refresh" not in st.session_state:
    st.session_state.auto_refresh = True
auto_refresh = st.checkbox("Auto-refresh", key="auto_refresh")
```

### Plotly chart transparent background

**WRONG — ignored by Plotly:**
```python
fig.update_layout(paper_bgcolor="transparent", plot_bgcolor="transparent")
```

**CORRECT:**
```python
fig.update_layout(paper_bgcolor="rgba(0,0,0,0)", plot_bgcolor="rgba(0,0,0,0)")
```
Plotly does not accept the string `"transparent"` for background colors — must use `rgba(0,0,0,0)`.

### `st.rerun()` with `scope="fragment"` outside fragments

**WRONG — crashes when called outside `@st.fragment` functions:**
```python
st.rerun(scope="fragment")  # only valid inside @st.fragment decorated functions
```

**CORRECT for auto-refresh loops:**
```python
st.rerun()  # no arguments — works everywhere in Streamlit 1.57+
```

### Auto-refresh blocking (`time.sleep` + `st.rerun`)

**WRONG — blocks page rendering for entire sleep duration, causes UI "dimming" every cycle:**
```python
time.sleep(st.session_state.refresh_interval)  # blocks the connection
st.rerun()  # reconnects → full app re-execution
# Result: page freezes during sleep, then "blinks" on rerun
```

**FIX — disable auto-refresh by default and/or use Streamlit fragments:**
```python
defaults = {"auto_refresh": False, ...}  # default OFF

# If enabled, prefer @st.fragment decorator on a specific widget area:
@st.fragment
def refresh_area():
    st.button("Refresh", key="refresh")
    if st.session_state.get("refresh"):
        st.rerun(scope="fragment")

# At top level (no fragment decorator), use plain st.rerun():
if st.session_state.auto_refresh:
    time.sleep(st.session_state.refresh_interval)
    st.rerun()  # no scope arg
```

### `pages` dict defined AFTER navigation code → `UnboundLocalError`

**WRONG — NameError at runtime, 7 of 11 pages render blank:**
```python
# Navigation check references `pages` dict
if potential_page in pages:  # UnboundLocalError: pages not defined yet
    st.session_state.page = potential_page

pages = {  # Dict defined AFTER the code that uses it
    "Overview": render_overview,
    "Channels": render_channels,
    ...
}
```

**CORRECT — define the dict FIRST:**
```python
pages = {
    "Overview": render_overview,
    "Channels": render_channels,
    ...
}

# Then navigation check
if potential_page in pages:
    st.session_state.page = potential_page
```

### Sidebar HTML links don't route in Streamlit

**WRONG — `<a href>` inside `st.markdown(unsafe_allow_html=True)` doesn't work for SPA navigation:**
```python
st.markdown(f'''
<a href="?page={link}">
    <div class="sidebar-link">{link}</div>
</a>
''', unsafe_allow_html=True)
# The URL changes but Streamlit doesn't re-render with new page
```

**CORRECT — use Streamlit's native navigation:**
```python
# Option 1: st.selectbox/radio in sidebar (persistent across reruns)
with st.sidebar:
    page = st.selectbox("Navigate", list(pages.keys()))

# Option 2: st.page_link (Streamlit 1.75+)
# Option 3: query params with full page reload (slow, 60s blank on some setups)
#   <a href="?page=PAGENAME" target="_top"> works but causes full reload
```

### Query params + auto-refresh = page reset loop

When auto-refresh (`st.rerun()`) runs, Streamlit resets `st.query_params` to default values on every cycle. This means navigation via `?page=XXX` links gets lost immediately if auto-refresh is on.

**FIX:** Keep auto-refresh OFF by default, or use session-state-based navigation only.

### Port already in use

Streamlit caches the port after starting. If restart fails with "Port 8501 is not available", kill all streamlit processes and wait 2-3 seconds:
```bash
pkill -9 -f "streamlit" 2>/dev/null; sleep 3
```
Then restart. Background processes with `terminal(background=true)` must be checked with `process(action="poll")` before killing.

### Streamlit page config must be before any other Streamlit calls

```python
import streamlit as st

st.set_page_config(page_title="My App", layout="wide")  # MUST be first st.* call
# ... rest of app
```

## Remember

- No design should be the same — vary fonts, themes, aesthetics
- Bold choices > safe choices
- When in doubt, commit and execute with precision
- Show what can be created thinking outside the box and committing fully