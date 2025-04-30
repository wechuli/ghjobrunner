
# ---------------------------------------------
# Format your Prisma schema
npx prisma format

# ---------------------------------------------
# Generate the Prisma Client
npx prisma generate

# ---------------------------------------------
# Validate the schema for syntax and logic issues
npx prisma validate

# ---------------------------------------------
# Pull schema from existing database (introspection)
# Only use this if you already have a DB and want to generate the schema from it
# echo "📥 Pulling schema from existing database..."
# npx prisma db pull

# ---------------------------------------------
# Create and run a new migration (change "init" to your desired name)
npx prisma migrate dev --name init

# ---------------------------------------------
# Check migration status (detect drift, etc.)

npx prisma migrate status

# ---------------------------------------------
# Optional: reset database (destructive! only for dev/test)
# echo "♻️ Resetting database..."
# npx prisma migrate reset

# ---------------------------------------------
# Deploy migrations (useful for production)
npx prisma migrate deploy

# ---------------------------------------------
# Run seed script if defined
npx prisma db seed

# ---------------------------------------------
# Launch Prisma Studio (browser-based DB UI)

npx prisma studio