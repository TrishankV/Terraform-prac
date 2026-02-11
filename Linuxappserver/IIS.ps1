# IIS i.e. Internet Information Servcies are microsfts 
# web server software to help it host websites nad APIS on Windows OS 
# So here we are making a WNIDOWS server in Azure 
# and then importing the IIS module to host the "web server"
# in that Windows server 

# So this is for importing he ServerManager module which is required 
# for the IIS 
import-module servermanager
add-windowsfeature web-server -includeallsubfeature
# hthus including all the deaurres of IIS 
set-content -path "C:\inetpub\wwwroot\Default.html" -Value "This is the server $($env:computername) !"
# to create a webpage by defualt to test if it is working or not 