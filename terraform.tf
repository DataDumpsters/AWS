#initial config for terraform to connect to AWS
terraform {
  required_version = ">= 1.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  access_key = "ASIARPVT26WF5UCYU7ZE"
  secret_key = "0bPlcx0dpVGIgZJ4x65bTw9nviQ6rav1LpCYIeM0"
  token = "IQoJb3JpZ2luX2VjED8aCXVzLXdlc3QtMiJIMEYCIQCKxBe3r0AMeXJD1qXPQOHLnFADWO8g9ijjzcVJ7xxSowIhAMxlmf+WQluk0cYzKFmc9A9wcNBuBNNtJjmp4kblSv90Kq0CCOj//////////wEQABoMMTAyMzgyNjMwMjgzIgx3tpKU/MDCS1Vo74IqgQL/vzZT18v/TseVCIg4EbNtYJVFmLf8XystnSkrUJ5zdYaa2pGu2gVg+hWDCFgw/l/r862yjLbJPt3BGr8soU7uBnRoqCmlJ2QGLHt9mw96gGZeE2fGJAJxNGDEu4+bpX+428Dv8QSXrKQ5lGz+oYX43G3el5+z0Ll3gE68Wp+dRdaRfS/Ka06+jRCT8m0BW//jHbocUiWjLuzCyifbEdJZkT7NuugiYsdO7zHw6uWSl2Had3DVqGZU9w4wEpWkV9rHC4Zmk4m3Ygy3CAkAJQEHJ/r1x8OiJbUSQ+cFXjpgD97wnBpvdex1yZ2vff85Oyuhn1+GHv+0J2FwJkUsBYzy0TCx+L+6BjqcAQ/Ra8sIfgEHU+y748UgQZH0vSz0DR8BX/XloctvlrsSr+PX3x86zbDCjslJtO4ZUjPkukk4iUMrO0WoTc5qzIKWvjb3X1h5lEDICkf8FCDixPoY9chZrez3mEWrWxCtQ/tROV1drs68e06UD28sUFhnE97ZmjBJUfFPJ+ABenxQAKStlIrkKReMoCIkmEu4GwDze2JQ1gO250xolg=="
}
    