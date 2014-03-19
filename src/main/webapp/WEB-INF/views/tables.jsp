<div id="grid" class="tundra"></div>

<!-- load Dojo -->
<script src="http://ajax.googleapis.com/ajax/libs/dojo/1.9.2/dojo/dojo.js"
        data-dojo-config="async: true"></script>

<script>
    require(["dojox/grid/DataGrid", "dojo/domReady!"], function(DataGrid){
        var store = [[
                { abbr:'ec', name:'Ecuador',           capital:'Quito' },
                { abbr:'eg', name:'Egypt',             capital:'Cairo' },
                { abbr:'sv', name:'El Salvador',       capital:'San Salvador' },
                { abbr:'gq', name:'Equatorial Guinea', capital:'Malabo' },
                { abbr:'er', name:'Eritrea',           capital:'Asmara' },
                { abbr:'ee', name:'Estonia',           capital:'Tallinn' },
                { abbr:'et', name:'Ethiopia',          capital:'Addis Ababa' }
            ]];
        var grid = new DataGrid({
            store: store,
            query: { id: "*" },
            structure: [
                { name: "Abbreviation", field: "abbr", width: "84px" },
                { name: "Full Name", field: "name", width: "84px" },
                { name: "Capital", field: "capital", width: "70px" }
            ]
        }, "grid");
    });
</script>