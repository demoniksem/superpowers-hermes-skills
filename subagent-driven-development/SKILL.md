---
name: subagent-driven-development
description: "Use when executing implementation plans with independent tasks — dispatch fresh subagent per task with two-stage review after each."
---

# Subagent-Driven Development

Execute a plan by dispatching fresh subagent per task, with two-stage review after each: spec compliance first, then code quality.

**Core principle:** Fresh subagent per task + two-stage review = high quality, fast iteration

**Continuous execution:** Do not pause to check in with the user between tasks. Execute all tasks from the plan without stopping. The only reasons to stop: BLOCKED status you cannot resolve, ambiguity that prevents progress, or all tasks complete.

## When to Use

| Have plan? | Tasks independent? | Stay in session? | Use |
|-----------|---------------------|-----------------|-----|
| Yes | Yes | Yes | subagent-driven-development |
| Yes | Yes | No | executing-plans |
| Yes | No | — | brainstorm first |
| No | — | — | brainstorm or manual |

## The Process

### Per Task

```
Dispatch implementer subagent
        ↓
Implementer asks questions? → Answer, provide context → Re-dispatch
        ↓ (no questions)
Implementer implements, tests, commits, self-reviews
        ↓
Dispatch spec reviewer subagent
        ↓
Spec reviewer confirms code matches spec? → No → Implementer fixes → Re-review
        ↓ (yes)
Dispatch code quality reviewer subagent
        ↓
Code quality reviewer approves? → No → Implementer fixes → Re-review
        ↓ (yes)
Mark task complete
```

### After All Tasks

```
Dispatch final code reviewer subagent for entire implementation
        ↓
Use finishing-a-development-branch
```

## Model Selection

Use the least powerful model that can handle each role:

- **Mechanical implementation** (isolated functions, clear specs, 1-2 files): fast, cheap model
- **Integration and judgment** (multi-file, debugging): standard model
- **Architecture, design, review**: most capable model

## Handling Implementer Status

| Status | Action |
|--------|--------|
| DONE | Proceed to spec compliance review |
| DONE_WITH_CONCERNS | Read concerns. If correctness/scope issues, address first. Otherwise note and proceed |
| NEEDS_CONTEXT | Provide missing context, re-dispatch |
| BLOCKED | Assess: more context → same model; more reasoning → more capable model; task too large → break apart; plan wrong → escalate |

## Dispatch Format

When dispatching implementer subagent, provide:
- **Specific scope:** What files/subsystem
- **Clear goal:** What to accomplish
- **Full task text:** Complete instructions (don't make subagent read the plan)
- **Context:** Where this task fits in the overall plan
- **Constraints:** What NOT to change

## Red Flags

**Never:**
- Start on main/master branch without explicit user consent
- Skip reviews (spec OR code quality)
- Proceed with unfixed issues
- Dispatch multiple implementation subagents in parallel
- Make subagent read plan file (provide full text instead)
- Move to next task while either review has open issues
- Start code quality review before spec compliance is ✅

## Required Workflow Skills

- **using-git-worktrees** — Ensures isolated workspace
- **writing-plans** — Creates the plan this skill executes
- **requesting-code-review** — Code review for reviewer subagents
- **finishing-a-development-branch** — Complete development after all tasks

## Example

```
You: I'm using Subagent-Driven Development to execute this plan.

[Read plan, extract all tasks, create TodoWrite]

Task 1: Hook installation script

[Dispatch implementer subagent with full task text + context]

Implementer: "Should the hook be installed at user or system level?"
You: "User level (~/.config/superpowers/hooks/)"

Implementer: [Implements, tests, commits]

[Dispatch spec compliance reviewer]
Spec reviewer: ✅ Spec compliant

[Dispatch code quality reviewer]
Code reviewer: ✅ Approved

[Mark Task 1 complete]

Task 2: Recovery modes

[Dispatch implementer subagent]

[Dispatch spec compliance reviewer]
Spec reviewer: ❌ Missing: Progress reporting

[Implementer fixes]
[Spec reviewer re-reviews]
Spec reviewer: ✅ Approved

[Mark Task 2 complete]

[After all tasks]
[Dispatch final code reviewer]
Final reviewer: Ready to merge

[Use finishing-a-development-branch]
```