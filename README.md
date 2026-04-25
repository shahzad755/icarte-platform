# iCarte

An Android tablet based restaurant ordering platform that lets customers browse menus, place and customize orders, and submit them directly from their table. Supports multi-language menus, special deals, and real time order management for restaurant staff.

## Architecture

The platform consists of five components:

**icarte-api** REST API backend built with sever side Java using Spring 3.2 and Hibernate 4 frameworks having MySQL as database. Handles authentication, menu handling, order processing, device management, and session tracking. It is packaged as a WAR and runs on Tomcat. Modules are organized by domain (order, item, menu, restaurant, branch, etc.) with 3 tier controller->service->DAO implementation.

**icarte-android** Android app for diners. Customers scan a QR code at their table to launch the menu, browse items by category, customize with addons/variants/spice levels, and make orders. It is built with Gradle using Volley for networking and Gson for JSON.

**icarte-admin-portal** Grails 2.4 web application for administration. Used to onboard restaurants, manage branches, configure menus and items, handle translations, set up tables, and monitor orders and feedback.

**icarte-restaurant-dashboard** PHP (CodeIgniter) web based dashboard for restaurant owners. Provides management of menu items, categories, reservations, customer inquiries, and transaction reports.

**icarte-database** MySQL scripts and data migration snapshots.

## Key Features

- Multi language support with per-item, per-category, and per-restaurant translations
- QR code based table identification and device registration
- Real time order tracking
- Special deals and promotion pricing
- Customer feedback and comments
- Multi branch restaurant support
- Role based access control for staff and administrators

## Data Model

Refer to `data-model.pdf` in the project root for the ER diagram. The order states are documented in `Order_State_Model.vsdx`.
