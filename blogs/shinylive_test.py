from shiny import App, render, ui
import numpy as np
import matplotlib.pyplot as plt

app_ui = ui.page_fluid(
    ui.layout_sidebar(
        ui.sidebar(
            ui.input_slider("period1", "Period", 0.5, 2, 1, step=0.5),
            ui.input_slider("period2", "Period", 0.5, 2, 1, step=0.5),
            ui.input_slider("amplitude1", "Amplitude", 0, 2, 1, step=0.25),
        ),
        # ui.panel_main(
        ui.output_plot("plot"),
        # ),
    ),
)


def server(input, output, session):
    @output
    @render.plot(alt="Sine function")
    def plot():
        t = np.arange(0.0, 4.0, 0.01)
        s = input.amplitude1() * np.sin(
            (2 * np.pi / input.period1()) * (t - input.shift1() / 2)
        )
        fig, ax = plt.subplots()
        ax.set_ylim([-2, 2])
        ax.plot(t, s)
        ax.grid()


app = App(app_ui, server)
