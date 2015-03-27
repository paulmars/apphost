git push origin master &&
  git push heroku master &&
  heroku run rake db:migrate &&
  curl apphoster.herokuapp.com > /dev/null
