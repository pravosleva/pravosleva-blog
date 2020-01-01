#!/bin/bash
echo "=== FULLSTACK INIT ===" &&

rm -rf frontend/ &&
rm -rf backend/ &&

rm -rf .git/ &&
rm -rf .gitignore &&
rm -rf README.md &&

# Clone reps
git clone https://github.com/pravosleva/pravosleva-blog-frontend-gatsby.git frontend &&
git clone https://github.com/pravosleva/pravosleva-blog-backend-mongodb.git backend &&

# Install
yarn --cwd ./frontend &&
yarn --cwd ./backend &&

# Backend side: Uploads dir init
BACKEND_DIR="${PWD}/backend"
UPLOADS_DIR="${BACKEND_DIR}/public/uploads"
echo "Проверка $UPLOADS_DIR"
if [ ! -d $UPLOADS_DIR ]
then
  echo "  >> $UPLOADS_DIR не существует..."
  mkdir $UPLOADS_DIR
  if [ -d $UPLOADS_DIR ]
  then
    echo "    >> Создана успешно."
  fi
else
  echo "  >> Аlready exists: $UPLOADS_DIR"
fi

bash envs-init.sh &&

echo "" &&
echo "  DEVELOPMENT" &&
echo "" &&
echo "👉 CHECK THIS BEFORE START:" &&
echo "  🔥 STEP 1: ./ecosystem.dev.config.js" &&
echo "  🔥 STEP 2 (if you dont use pm2): ./frontend/.env.development" &&
echo "" &&
echo "🚀 $ pm2 start ecosystem.dev.config.js" &&
echo "" &&
echo "===" &&
echo "" &&
echo "  PRODUCTION" &&
echo "" &&
echo "👉 CHECK THIS BEFORE START:" &&
echo "  🔥 STEP 1: ./frontend/.env.production" &&
echo "  🔥 STEP 2: ./ecosystem.prod.config.js" &&
echo "" &&
echo "🚀 $ bash build-all-prod.sh" &&
echo "" &&
# Ниже коментарий для 1-й итерации:
# echo "Кстати, при каждом build-front-prod.sh (точнее, frontend/postbuild.sh) во внешней директории должна быть создана либо дополнена /uploads из backend/uploads" &&
# echo "" &&
echo "🚀 $ pm2 start ecosystem.prod.config.js" &&
echo "" &&
echo "=== 👌" && # rm -rf fullstack-init.sh
echo "Congrats!" &&

bash build-all-prod.sh
