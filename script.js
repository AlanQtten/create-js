import { Json } from 'json-wizard'
import fs from "node:fs"

new Json(`${process.argv[2]}/package.json`)
  .set('scripts', {
    "dev": "vite dev",
    "build": "vite build",
    "test": "vitest"
  })
  .delete('private')
  .write()