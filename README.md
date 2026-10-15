# CodeTrack AI — DSA Tracker & Placement Mentor

A runnable full-stack starter application for tracking DSA practice, mistakes, revisions, focus sessions, and placement preparation. Built with React + TypeScript + Vite on the frontend and Express + TypeScript on the backend.

> **Honest scope note:** This is a functional MVP/starter, not yet a fully production-hardened SaaS. The included mentor is rule-based and uses stored progress; it is not connected to an external LLM. LeetCode/GeeksforGeeks automatic account synchronization is not included because access depends on official/permitted provider capabilities. The question bank contains a small set of curated public problem links and metadata, not copied problem statements.

## Features implemented

- Email/password registration and login with hashed passwords and JWT authentication.
- Persistent local JSON store (simple local-development adapter; migrate to PostgreSQL before multi-user production deployment).
- Starter question bank for LeetCode and GeeksforGeeks links.
- Search and filters for title, topic, difficulty, and platform.
- Add custom questions.
- Log success/failure, independent/hint/solution-assisted solve, time, confidence, mistake category, and notes.
- Per-question attempt history data and mastery estimate.
- Adaptive next-revision scheduling; overdue revision center.
- Dashboard metrics, 7-day chart, topic progress, recommendations.
- Analytics and mistake-category aggregation.
- Focus session timer persisted by the backend.
- Rule-based mentor endpoint using saved progress.
- Theme switching (Dark, Light, OLED, Midnight, Forest, Nord-inspired).
- User settings, company target selection, JSON data export, account deletion endpoint.
- Responsive UI, loading states, form validation, API error messages.

## Requirements

- Node.js 20+ (Node 22 recommended)
- npm 10+

## Run locally

1. Extract this folder.
2. In the project root, run:

   ```bash
   npm install
   ```

3. Copy `.env.example` to `server/.env` (or configure the variables in your shell). For local use, the server has a development fallback secret; change `JWT_SECRET` before sharing/deploying.
4. Start the frontend and API:

   ```bash
   npm run dev
   ```

5. Open `http://localhost:5173`. The API health endpoint is `http://localhost:4000/api/health`.

The API writes its development data to `server/data.json`. This is convenient for a local MVP, but not suitable for a production deployment with concurrent users, backups, or sensitive data. Do not commit that file.

## Build and type check

```bash
npm run build
```

## Project structure

```text
codetrack-ai/
  client/              React + TypeScript + Vite UI
    src/App.tsx        Application screens and interactions
    src/style.css      Responsive design system and themes
  server/
    src/index.ts       Express API, validation, auth, persistence, revision logic
    tsconfig.json
  .env.example
  README.md
```

## Important limitations and next production steps

1. Replace the JSON persistence adapter with PostgreSQL + Prisma and migrations.
2. Add secure, revocable server-side sessions or refresh-token rotation, email verification, password reset, CSRF controls as applicable, and robust rate limiting before public deployment.
3. Add automated unit/integration/E2E tests and CI. This starter has not been security audited.
4. Implement an LLM provider adapter server-side; keep API keys out of the browser. Validate model output and add budget/rate controls.
5. Add LeetCode/GFG integrations only through documented and permitted APIs/import methods; never collect platform passwords or cookies.
6. Build a verified, dated company-preparation content dataset. Company labels currently represent starter guidance and are not verified interview-frequency claims.
7. Add a background worker, observability, backups, and deployment configuration for production.

## Privacy

The app tracks time spent in its own focus sessions and logged attempts. It does **not** monitor the user's entire device screen time or activity outside the app. Use only sample information until you have reviewed the local storage and security model.
