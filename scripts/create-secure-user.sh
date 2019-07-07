#!/bin/bash
set -e

mongo <<EOF
use admin
db.auth("$MONGO_INITDB_ROOT_USERNAME", "$MONGO_INITDB_ROOT_PASSWORD" )

use jobsDataPool
db.createUser({
  user: '$WHIRLPOOL_MONGODB_CRAWLER_USERNAME',
  pwd: '$WHIRLPOOL_MONGODB_CRAWLER_PWD',
  roles: [{
    role: 'readWrite',
    db: 'jobsDataPool'
  }]
})

db.createUser({
  user: '$WHIRLPOOL_MONGODB_WEBAPP_USERNAME',
  pwd: '$WHIRLPOOL_MONGODB_WEBAPP_PWD',
  roles: [{
    role: 'read',
    db: 'jobsDataPool'
  }]
})
EOF
