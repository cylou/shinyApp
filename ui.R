shinyUI(pageWithSidebar(
        headerPanel("Compute your own Body Mass Index"),
        sidebarPanel("Please fill in your height and weight:",
                numericInput("height", "Your height in cm", 180, min=100,
                             max=250, step=1),
                numericInput("weight", "Your weight in kg", 70, min=40,
                             max=200, step=1)
        ),

        mainPanel(
                h3("Results of prediction"),
                h5("You entered the following height, in cm"),
                verbatimTextOutput("inputHeight"),
                h5("You entered the following weight, in kg"),
                verbatimTextOutput("inputWeight"),
                h5("Which gives you a BMI of"),
                verbatimTextOutput("prediction"),
                h5("This is"),
                verbatimTextOutput("explanation"),
                h5("Have a look at the graph below, your BMI is the red line."),
                plotOutput("graph"),
                h5("Play with the inputs to see how the BMI evoles within the graph."),
                h5("Thanks for using this app !!")
        )
))
