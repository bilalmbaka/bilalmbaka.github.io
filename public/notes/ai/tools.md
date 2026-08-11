## What is tool calling?

[IBM](https://www.ibm.com/think/topics/tool-calling)

Tool calling refers to the ability of artificial intelligence (AI) models to 
interact with external tools, application programming interfaces (APIs) or 
systems to enhance their functions.

Instead of relying solely on pretrained knowledge, an AI system with tool-calling 
capabilities can query databases, fetch real-time information, execute functions 
or perform complex operations beyond its native capabilities.

## How does tool calling work?

The first component is the AI model itself, which recognizes when it lacks sufficient 
knowledge or requires an external function to complete a request.

Next, the tool selection mechanism identifies the appropriate dependencies to handle the 
specific task, whether it is a search engine, a database or a computational resource.

When a tool is selected, the API interface comes into play, allowing the AI to send 
structured queries and receive responses in a machine-readable format.

__Step 1. Recognizing the need for a tool__

Let’s say a user asks an LLM “What’s the weather in San Francisco right now?” The AI 
uses natural language understanding to recognize that real-time weather data is needed, 
which cannot be derived from its static knowledge base.

A unique tool call ID is assigned automatically to a request made by a model to use a 
tool, which acts as a tracking number to link the request with its corresponding result.

__Step 2. Selecting the tool__

The AI identifies the best tool for the task, in this case checking a current weather 
database. This step helps ensure that the retrieved information is accurate and relevant.

Each tool contains metadata and structured information such as a unique tool name 
(or function name), which helps the model and system identify it correctly. Other metadata 
include description, tool parameters and required input and output types.

The model performs a tool choice after determining that data must be obtained from a selection 
of available tools.

Templates are structured prompt formats that tell the model which tool to use and what arguments 
(or “args”) to provide, allowing for more controlled and structured interactions with APIs.

In the context of tool calling, args refer to the structured inputs passed to a tool or function 
when it is started by a generative model. These arguments define the parameters that the tool 
requires to execute properly.

Combining tool calling with retrieval augmented generation (RAG) enhances AI capabilities by 
allowing systems to retrieve both structured and unstructured data before generating structured 
outputs.

This approach enhances contextual relevance by fetching the most pertinent data before generating 
a response, leading to more informed and accurate outputs.

It also minimizes API overhead by consolidating multiple retrievals into a single step, reducing 
latency and costs. RAG is more flexible than traditional tool calls, allowing models to pull from 
diverse sources and making it highly adaptable across different domains.

Unlike the rigid structure of traditional tool use, RAG enables more fluid integration of retrieved 
knowledge with reasoning and generation, resulting in more dynamic and insightful responses.

__Step 3. Constructing and sending a query__

The AI then formulates a structured request that the tool or API can understand.

Each tool is associated with specific tool functions, which define what the tool does. These 
functions rely on an API reference, which provides documentation on how to interact with the 
tool’s API, including endpoint URLs, request methods and response formats.

To access an external API, many services require an API key, a unique identifier that grants 
permission to make requests. When the tool is selected and the parameters are set, an API call 
is made to fetch the requested data. This request is typically sent over HTTP to an external server.

__Step 4. Receiving and processing the response__

The external tool returns data. The AI must then parse the tool results. For a weather request, 
the API might respond with a JSON schema object containing temperature, humidity and wind speed. 
The AI filters and structures this data to summarize a meaningful response for the user.

__Step 5. Presenting the information or taking action__

The AI delivers the processed information in an intuitive manner. If the request involves automation, 
such as setting a reminder, the AI would confirm that an action has been scheduled.

__Step 6. Refining the search__

If the user requests more details or modifications, the AI can repeat the process with an adjusted query, 
helping to ensure that it continues to refine its response based on user needs.

LangChain is commonly used in tool calling by providing an open source framework for integrating external 
tools, APIs and functions with LLMs. It helps manage tool execution, input or output handling and 
context-aware decision-making.

For example, LangChain handles function arguments with a parser for user queries, extracting relevant 
parameters and formatting them correctly for the tool. Unlike simple tool calling, LangChain can store 
and recall previous tool outputs, enabling better multiturn interactions.

LangChain allows for the combination of multiple tools in a sequence, enabling more complex agentic 
workflows. For example, it can first retrieve data from the weather API and then use a separate tool 
to recommend clothing based on the forecast.

