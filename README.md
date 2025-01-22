# Data_Engineering_Project

## Introduction 
## About Data
**Name of the data**:- Adventure Works  
Adventure Works is a comprehensive dataset designed for real-world data engineering and analytics projects. It includes multiple dimension and fact tables, representing various business processes over several years. This dataset is perfect for understanding complex relationships in a structured database. It is widely used for ETL, data modeling, and reporting practices. Access the original dataset at [Kaggle](https://www.kaggle.com/datasets/ukveteran/adventure-works?resource=download )
## Architecture 
![Architecture](Arichitecture.png)
## Services used
1. Resource Group - Container
2. Data Lake Gen 2 - Storage 
3. Data Factory - Extracting On-Premise to Storage account
4. Databricks - Transformation
5. Synapse Analytics - Warehouse 
6. Power BI - Business Insights

## Steps Involved 
1. Creat a Resource Group
2. Creat a Data Lake Gen 2 and inside that create 3 containers intially as Raw(Bronze), Transformed(Silver) and Gold
3. Now, create a Azure Data Factory and inside that create a new pipeline
4. Make this new pipeline as a dynamic pipeline by adding 2 activity Lookup, ForEach
   - Lookup
       - Add Linked Service and the Source dataset as JSON file which needs to be created and saved in Azure Data Lake Gen 2
       - Uncheck **Settings -> FirstRow**
       - [git.json](https://github.com/vaibhavgaur20/Data_Engineering_Project/blob/main/git.json)
   - ForEach
       - Add @activity('Lookup1').output.value inside **Settings -> Items**
       - Inside ForEach create a new copy activity
       - Copy (needs 3 parameters in total)
           - Source :- Add Sorce Dataset as Delimited Text and add Linked Services as HTTP then at the end choose advanced settings and create a new parameter named as _p_rel_url_
           - Sink :- Add Sorce Dataset as Delimited Text and add Linked Services as Azure Data Lake Gen 2 then at the end choose advanced settings and create a 2 new parameter named as _p_sink_folder_ and _p_file_name_

![DynamicPipeline](DynamicPipeline.png)
5. Hit Debug to run the pipeline 
![Success](ADFSuccess.png)

6. Lets Create Databricks and its cluster
![ClusterConfig](Clustercongif.png)

7. Now Search for Microsoft Entra ID and then go to **App registration** -> **new registration** and name it as awproject_app
8. once created note down 2 things
   - Apllication (client) ID :-  7e626afc-a398-4582-9e6c-fea8467999b3
   - Directory (tenant) ID :- 30146931-56ac-4796-a894-1086a03edf7f
   - Object ID :- 724df01f-0c9d-413d-86af-7f49b9f2a41b
9. Now go to **Certificates & secretes** -> **New client secret** and name it as _awproject_
10. Now copy the **Value** and store it somewhere 
