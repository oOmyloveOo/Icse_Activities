// Function to parse XML and populate table
function parseXML(xmlString) {
    const parser = new DOMParser();
    const xmlDoc = parser.parseFromString(xmlString, "text/xml");
    const employees = xmlDoc.getElementsByTagName("empleado");
    
    let tableContent = "<tr><th>ID</th><th>Nombre</th><th>Edad</th><th>Departamento</th><th>Salario</th></tr>";
    
    for (let i = 0; i < employees.length; i++) {
        const id = employees[i].getAttribute("id");
        const nombre = employees[i].getElementsByTagName("nombre")[0].childNodes[0].nodeValue;
        const edad = employees[i].getElementsByTagName("edad")[0] ? employees[i].getElementsByTagName("edad")[0].childNodes[0].nodeValue : "";
        const departamento = employees[i].getElementsByTagName("departamento")[0].childNodes[0].nodeValue;
        const salario = employees[i].getElementsByTagName("salario")[0] ? employees[i].getElementsByTagName("salario")[0].childNodes[0].nodeValue : "";
        
        tableContent += `<tr><td>${id}</td><td>${nombre}</td><td>${edad}</td><td>${departamento}</td><td>${salario}</td></tr>`;
    }
    
    document.getElementById("xmlTable").innerHTML = tableContent;
}

function parseJSON(jsonString) {
    const jsonData = JSON.parse(jsonString);
    const employees = jsonData.empleados;
    
    let tableContent = "<tr><th>ID</th><th>Nombre</th><th>Edad</th><th>Departamento</th><th>Salario</th></tr>";
    
    employees.forEach(employee => {
        const id = employee.id;
        const nombre = employee.nombre;
        const edad = employee.edad ? employee.edad : "";
        const departamento = employee.departamento;
        const salario = employee.salario ? employee.salario : "";
        
        tableContent += `<tr><td>${id}</td><td>${nombre}</td><td>${edad}</td><td>${departamento}</td><td>${salario}</td></tr>`;
    });
    
    document.getElementById("jsonTable").innerHTML = tableContent;
}

fetch("datos.xml")
    .then(response => response.text())
    .then(xmlString => {
        parseXML(xmlString);
    })
    .catch(error => console.error("Error fetching XML:", error));
    
fetch("datos.json")
    .then(response => response.json())
    .then(jsonData => {
        parseJSON(JSON.stringify(jsonData));
    })
    .catch(error => console.error("Error fetching JSON:", error));
