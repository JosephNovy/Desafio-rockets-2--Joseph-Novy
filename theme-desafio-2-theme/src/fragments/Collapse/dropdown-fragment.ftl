[#assign collapse = configuration.habilitarCollapse]
<div class="my-container">
    <lfr-drop-zone id="drop-zone-collapse" class="drop-zone-collapse ${collapse}">
        ${collapse}
    </lfr-drop-zone>
    <lfr-drop-zone id="drop-zone" class="drop-zone ${collapse === 'Habilitado' ? d-none : d-block}">
        ${collapse}
    </lfr-drop-zone>
</div>

const button = fragmentElement.querySelector('.collapse-button');
const target = fragmentElement.querySelector('.collapse-target');

   if (button) {
	    button.addEventListener('click', () => {
      target.classList.toggle('show');
    });
	 }


{
    "fieldSets": [ {
        "fields": [
            {
                "name": "habilitarCollapse",
                "label": "Habilitar Collapse",
                "description": "Selecione se deseja que o componente possua collapse.",
                "type": "select",
                "dataType": "string",
                "typeOptions": {
                    "validValues": [
                        {
                            "label": "Habilitado",
                            "value": "true"
                        },
                        {
                            "label": "Desabilitado",
                            "value": "false"
                        }
                    ]
                },
                "defaultValue": "true"
            }
        ]
    }]
}