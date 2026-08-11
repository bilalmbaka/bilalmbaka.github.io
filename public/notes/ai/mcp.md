[Google](https://cloud.google.com/discover/what-is-model-context-protocol)

The Model Context Protocol (MCP) is an open standard designed to solve this. 
Introduced by Anthropic in November 2024, MCP provides a secure and standardized 
"language" for LLMs to communicate with external data, applications, and services.

## MCP architecture and components

The Model Context Protocol has a clear structure with components that work together 
to help LLMs and outside systems interact easily.

__MCP host__
The LLM is contained within the MCP host, an AI application or environment such as 
an AI-powered IDE or conversational AI. This is typically the user's interaction point, 
where the MCP host uses the LLM to process requests that may require external data or tools.

__MCP client__
The MCP client, located within the MCP host, helps the LLM and MCP server communicate with 
each other. It translates the LLM's requests for the MCP and converts the MCP's replies for 
the LLM. It also finds and uses available MCP servers.

__MCP server__
The MCP server is the external service that provides context, data, or capabilities to the LLM. 
It helps LLMs by connecting to external systems like databases and web services, translating their 
responses into a format the LLM can understand which helps developers provide diverse functionalities.

__Transport layer__
The transport layer uses JSON-RPC 2.0 messages to communicate between the client and server, mainly 
through two transport methods:

Standard input/output (stdio): Works well for local resources, offering fast, synchronous message transmission
Server-sent events (SSE): Preferred for remote resources, allowing efficient, real-time data streaming

## How does the MCP work?

At its core, the Model Context Protocol allows an LLM to request help from external tools to answer 
a query or complete a task. Imagine you ask an AI assistant: "Find the latest sales report in our database 
and email it to my manager."

Here is a simplified look at how MCP would handle this:

1. Request and tool discovery: The LLM understands it cannot access a database or send emails on its own. 
It uses the MCP client to search for available tools, where it finds two relevant tools registered on MCP 
servers: a database_query tool and an email_sender tool.

2. Tool invocation: The LLM generates a structured request to use these tools. First, it calls 
the database_query tool, specifying the report name. The MCP client then sends this request to the 
appropriate MCP server.

3. External action and data return: The MCP server receives the request, translates it into a secure SQL 
query for the company's database, and retrieves the sales report. It then formats this data and sends it 
back to the LLM.

4. Second action and response generation: Now equipped with the report data, the LLM calls the email_sender tool, providing the manager's email address and the report content. After the email is sent, the MCP server confirms 
the action was completed.

5. Final confirmation: The LLM provides a final response to you: "I have found the latest sales report 
and emailed it to your manager."


## MCP versus RAG

Both Model Context Protocol (MCP) and Retrieval-Augmented Generation (RAG) improve LLMs with outside information, 
but they do this through different ways and serve distinct purposes. RAG finds and uses information for creating 
text, while MCP is a wider system for interaction and action.

