## Ticket Manager
Writer: Koo Bonchan
start date: 241111, end date: 241118
language: jsp + servlet

### Requirements
* Poll CRUD (without update, delete)
  * Poll (id, question, start date, end date, write date, multi-select allowed, is active)
  * Poll item (poll id, item id, name, count)
  * Add new poll, Vote, See result, See poll list

### Changes I've made from original
* Added connection pool with SimpleDataSource library
* Simple front-end layout using CSS
* Feature: unlimited poll item when adding new poll, using VanillaJS

### Challenges
* Naming policy not clear
  * poll, poll item, item, ...
  * Similar items with similar name, confusing 
* Workflow, Sequence not clear
* 
