bmi <- function(height, weight) {round(weight/(height/100)^2, 2)}
explanation <- function(my_bmi) {
        if(my_bmi < 18.5) {
                print("Too low !")
        } else if (my_bmi > 25) {
                print("Too high !")
        } else {
                print("Good !!")
        }
}

shinyServer(
        function(input, output) {
                output$inputHeight <- renderPrint({input$height})
                output$inputWeight <- renderPrint({input$weight})

                output$prediction <- renderPrint({bmi(input$height, input$weight)})
                output$explanation <- renderPrint({explanation(bmi(input$height, input$weight))})

                output$graph <- renderPlot({
                        barplot(as.matrix(c(18.5,(25-18.5),(40-25))), width=2,
                                ylab="BMI", xlim=c(0,5))
                        abline(h=bmi(input$height, input$weight), col="red", lwd=4)
                        text(10, "Too low")
                        text(30, "Too high")
                        text(22, "Good")
                })


        }
)
