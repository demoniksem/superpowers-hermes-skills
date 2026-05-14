---
name: brainstorming
description: "**MANDATORY before any creative work** — features, components, functionality, or behavior changes.

**Does NOT apply to:** infrastructure tooling, scripts, configs, one-off dashboards, debug utilities, data gathering, research tasks, analysis work. For these, just do it and explain briefly if asked."
---

# Brainstorming Ideas Into Designs

Help turn ideas into fully formed designs and specs through natural collaborative dialogue.

Start by understanding the current project context, then ask questions one at a time to refine the idea. Once you understand what you're building, present the design and get user approval.

<HARD-GATE>
Do NOT invoke any implementation skill, write any code, scaffold any project, or take any implementation action until you have presented a design and the user has approved it.
</HARD-GATE>

## Scope

**Creative work (this skill):** feature design, UI/UX, product changes, visual systems, new component architecture.

**NOT this skill (just do):** data analysis, research, match analysis, information gathering, scripting, configs, bug fixes, devops, one-off utilities.

## Anti-Pattern

Every project goes through this process. A todo list, a single-function utility, a config change — all of them. "Simple" projects are where unexamined assumptions cause the most wasted work.

## Checklist

1. **Explore project context** — check files, docs, recent commits
2. **Offer visual companion** (if visual questions ahead) — separate message, no other content
3. **Ask clarifying questions** — one at a time
4. **Propose 2-3 approaches** — with trade-offs and your recommendation
5. **Present design** — scaled to complexity, get approval after each section
6. **Write design doc** — save to `docs/superpowers/specs/YYYY-MM-DD-<topic>-design.md` and commit
7. **Spec self-review** — check for placeholders, contradictions, scope
8. **User reviews written spec** — before proceeding
9. **Transition to implementation** — invoke writing-plans skill

## Process Flow

```
Explore context → Visual questions? → Offer Visual Companion
                     ↓
              Ask clarifying questions (one at a time)
                     ↓
              Propose 2-3 approaches
                     ↓
              Present design sections
                     ↓            ↓
               Revise          Approved
                     ↓            ↓
              Write design doc → Spec self-review
                     ↓            ↓
               Changes       User reviews
                     ↓            ↓
              Invoke writing-plans
```

## Key Principles

- **One question at a time** — don't overwhelm
- **Multiple choice preferred** when possible
- **YAGNI ruthlessly** — remove unnecessary features
- **Explore alternatives** — 2-3 approaches before settling
- **Incremental validation** — get approval before moving on
- **Design for isolation** — smaller units with clear boundaries

## After the Design

**Documentation:**
- Write spec to `docs/superpowers/specs/YYYY-MM-DD-<topic>-design.md`
- Commit the design document to git

**Spec Self-Review:**
1. Placeholder scan: Any "TBD", "TODO", incomplete sections?
2. Internal consistency: Do sections contradict?
3. Scope check: Focused enough for single implementation plan?
4. Ambiguity check: Could any requirement be interpreted two ways?

**User Review Gate:**
> "Spec written to `<path>`. Please review before we start the implementation plan."

Wait for approval. If changes requested, make them and proceed only after user approves.

## Visual Companion (Optional)

When upcoming questions involve visual content, offer once:

> "Some of what we're working on might be easier to show in a browser — mockups, diagrams, comparisons. Want to try it?"

This MUST be its own message. If they decline, proceed text-only.

For EACH question decide: **browser** (mockups, layouts, diagrams) vs **terminal** (concepts, requirements, tradeoffs).

## Next Step

After design approved and spec committed: invoke `writing-plans` skill to create implementation plan. Do NOT invoke frontend-design, mcp-builder, or any other implementation skill.

## Frontend Design

For frontend work, incorporate design principles from `references/frontend-design-plugin.md`:
- Commit to a bold aesthetic direction before coding
- Use distinctive typography (not Inter/Roboto/Arial)
- Apply cohesive color with sharp accents (avoid purple gradients)
- Use motion for high-impact moments, not scattered micro-interactions
- Prioritize atmosphere/depth in backgrounds over flat colors