# deploy.sh
# ����ʱֹͣ
set -e

# ���
npm run build

# ����Ŀ���ļ���
cd dist

# �ύ�����زֿ�

git init
git add -A
git commit -m 'deploy'

git push -f git@github.com:baxiyi/Vue-todoList.git master:gh-pages

cd -