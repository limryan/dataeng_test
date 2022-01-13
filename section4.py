import requests
from datetime import date
import pandas as pd
import plotly.express as px
import dash 
from dash import dcc
from dash import html

# pull data from covid19api.com
current_date = date.today().strftime("%Y-%m-%d")
data_request = requests.get('https://api.covid19api.com/country/singapore?from=2020-01-01T00:00:00Z&to='+current_date+'T00:00:00Z')
data = data_request.text

# extract case data from json
covid_cases = pd.read_json(data)
covid_cases = covid_cases[['Confirmed','Deaths','Recovered','Active','Date']]
covid_cases.set_index('Date', inplace=True)

# create line graph of cases over time
fig1 = px.line(covid_cases, title='Covid Cases in Singapore') 

# show daily new cases
covid_cases['New Cases'] = covid_cases['Confirmed'].diff()

# create line graph of daily new cases
fig2 = px.line(covid_cases['New Cases'], title='Daily new cases in Singapore')

# setup dashboard
app = dash.Dash(__name__)
app.title = "COVID-19 in Singapore"

app.layout = html.Div(
    children=[
        html.H1(children="COVID-19 in Singapore",),
        dcc.Graph(
            figure=fig1
        ),
        dcc.Graph(
            figure=fig2
        ),
    ]
)

# run dashboard
if __name__ == "__main__":
    app.run_server(debug=True)