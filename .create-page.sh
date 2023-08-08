#!/bin/bash

# Check if page name is provided
if [ -z "$1" ]
then
    echo "No page name provided. Usage: ./create-page.sh [PageName]"
    exit 1
fi

# Page name
PAGE_NAME=$1
APP_DIR=/app

# Create a new directory in the pages directory
mkdir -p .$APP_DIR/$PAGE_NAME

# Define a template for the new page
TEMPLATE="import React from 'react';\nimport styles from './${PAGE_NAME}.module.css'\n\nexport default function Page() {\n    return (\n        <div className={styles.shell}>\n            <h1>This is the ${PAGE_NAME} page</h1>\n        </div>\n    )\n}"

# Create a new index.js file with the template
echo -e $TEMPLATE > ./$APP_DIR/$PAGE_NAME/page.js

# Create a new CSS module for the page
echo -e ".shell {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  min-height: calc(100vh - 6rem);
  margin: 0;
  padding: 0;
  outline: none;
}
.clampName {
  -webkit-line-clamp: 1;
  -webkit-box-orient: vertical;
  overflow: wrap;
}
.main {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  align-items: center;
  height: 100%;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  background-color: rgba(0, 0, 0, 0.5);
  background-blend-mode: overlay;
  border-radius: 1rem;
  min-width: 320px;
  max-width: 1024px;
  margin: auto;
}
.main h1 {
  font-size: 3rem;
  font-weight: 600;
  color: #fff;
  text-align: center;
  margin: 1rem;
}
.main h2 {
  font-size: 2rem;
  font-weight: 600;
  color: #fff;
  text-align: center;
  margin: 1rem;
}
.main p {
  font-size: 1.5rem;
  font-weight: 600;
  color: #fff;
  text-align: center;
}
.linkStyle {
  color: #fff;
  text-decoration: none;
  font-size: 1.5rem;
  font-weight: 600;
  text-align: center;
  padding: 1rem;
  border-radius: 1rem;
  background-color: rgba(0, 0, 0, 0.5);
  backdrop-filter: blur(4px);
  transition: all 0.2s ease-in-out;
  margin: 1rem;
}
.linkStyleConst {
  font-size: 1.5rem;
}
@media screen and (max-width: 768px) {
  .main {
    border-radius: 0rem;
  }
  .main h1 {
    font-size: 2rem;
  }
  .main h2 {
    font-size: 1.5rem;
  }
  .main p {
    font-size: 1.2rem;
  }
  .linkStyle,
  .linkStyleConst {
    font-size: 1.2rem;
  }
}" > ./$APP_DIR/$PAGE_NAME/${PAGE_NAME}.module.css

echo -e "export default function Layout({ children }) {
  return (
    <section>
      {children}
    </section>
  )
}" > ./$APP_DIR/$PAGE_NAME/layout.js

echo -e "export default function Loading() {
  return (
    <div
      style={{
        display: 'flex',
        justifyContent: 'center',
        alignItems: 'center',
        height: '100vh',
        width: '100vw',
        backgroundColor: 'rgb(234, 232, 229)',
        color: '#f5f5f5',
        fontSize: '2rem',
        textAlign: 'center'
      }}
    >
      <div
        style={{
          display: 'flex',
          flexDirection: 'column',
          justifyContent: 'center',
          alignItems: 'center',
        }}
      >
        <div
          style={{
            width: '100px',
            height: '100px',
            border: '10px solid #f5f5f5',
            borderTop: '10px solid #333',
            borderRadius: '50%',
            animation: 'spin 1s linear infinite',
          }}
        ></div>
        <div
          style={{
            marginTop: '20px',
            fontSize: '1rem',
            fontWeight: 'bold',
          }}
        >
          Loading...
        </div>
      </div>
    </div>
  )
}" > ./$APP_DIR/$PAGE_NAME/loading.js

echo "Page , Loading, Layout and, CSS module created at .$APP_DIR/$PAGE_NAME/"
