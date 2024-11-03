# switch (expression, case1, case2, case3,....)

switch (1, "red", "green","blue")

switch ("bg", "name"="Alpha", "age"= 20, "bg"="A+")


# While Loop
# while (cond)
#   statement

i<- 1
while(i<6){
  print (i)
  i<- i+1
}

# break statement in while Loop

i<- 1
while(i<6){
  print (i)
  i<- i+1
  if(i==4){
    break
  }
}


i<- 0
while(i<6){
  
  i<- i+1
  if(i==3){
    next
  }
  print (i)
}

#                    for Loop
#
# for(var in seq)
#   print(x)

for (x in 1:10){
  x= x+1
  print(x)
}

# Nested for Loop
for (x in 1:2){
  for(y in 1:3){
    print(x*y)
  }
}

#                                                 Functions
#
# myfunction <- function (arg1, arg2, ...){
#   statements
#   retracemem(object)
# }

add_numbers <- function(a,b){
  sum <- a+b
  return(sum)
}
print(add_numbers(4,5))