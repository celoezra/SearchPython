try: 
    from googlesearch import search 
except ImportError:
    print("No module named 'google' found")
query = ( input ("Escreva o que quer saber: "))

for resultado in search (query, tld="co.in", num=10, stop=10, pause=2):
    print(resultado)

import webbrowser
webbrowser.open ( input ("Cole o link: "))
print("Fim da busca")


