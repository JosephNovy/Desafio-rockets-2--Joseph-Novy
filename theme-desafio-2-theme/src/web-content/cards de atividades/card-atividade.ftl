<#assign Mock = [
  {
    "atividades":[
      {
        "titulo": "Entrega projeto 1",
        "descricao": "A paragraph is a self-contained unit of a discourse in writing dealing with a particular point or idea. ",
        "dataEntrega": "22/09/2024",
        "status": "Pendente",
        "prioridade": "1",
        "id":"1"
      },
      {
        "titulo": "Entrega projeto 2",
        "descricao": "A paragraph is a self-contained unit of a discourse in writing dealing with a particular point or idea. A paragraph is a self-contained unit of a discourse in writing dealing with a particular point or idea. ",
        "dataEntrega": "10/09/2024",
        "status": "Concluído",
        "prioridade": "2",
        "id":"2"
      },
      {
        "titulo": "Entrega projeto 3",
        "descricao": "A paragraph is a self-contained unit of a discourse in. ",
        "dataEntrega": "24/09/2024",
        "status": "Cancelado",
        "prioridade": "3",
        "id":"3"
      },
      {
        "titulo": "Entrega projeto 4",
        "descricao": "A paragraph is a self-contained unit of a discourse in writing dealing with a particular point or idea. A paragraph is a self-contained.",
        "dataEntrega": "26/09/2024",
        "status": "Pendente",
        "prioridade": "2",
        "id":"4"
      }
    ]
  }
]>

<div class="componente-atividades p-2 mx-auto">
  <div class="d-flex flex-column flex-sm-row gap-sm-1 filtro-container mb-2">
    <div class="input-group input-group-sm mb-3 mb-sm-1 flex-column justify-content-start w-100 w-sm-auto">
      <label class="input-group-text justify-content-start" for="prioridadeSelect">Prioridade</label>
      <select name="prioridade" class="form-select w-100" id="prioridadeSelect" aria-label="Default select example" onchange="filterActivities()">
        <#list ["Sem prioridade", "1", "2", "3"] as prioridade>
          <option value="${prioridade}">${prioridade}</option>
        </#list>
      </select>
    </div>
    <#if request.getParameter("prioridadeSelect")?has_content>
      <#assign selectedPrioridade = request.getParameter("prioridadeSelect")>
    <#else>
      <#assign selectedPrioridade = "1">
    </#if>
  <div class="input-group flex-column input-group-sm mb-3  mb-sm-1 w-100 w-sm-auto">
    <span class="input-group-text justify-content-start" id="inputGroup-sizing-sm">Filtrar por Data</span>
    <input type="date" id="dataEntrega" class="form-control w-100" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" onchange="filterActivitiesByDate()">
  </div>
  <div class="d-flex align-items-end mb-1 w-100 w-sm-auto">
    <button class="btn-new-atividade px-3 py-2" type="button" data-bs-toggle="modal" data-bs-target="#modal-criar-atividade">Criar Atividade</button>
  </div>
  </div>
  <!-- Modal -->
  <div class="modal fade" id="modal-criar-atividade" tabindex="-1" aria-labelledby="modal-criar-atividade-label" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="titleLabel">Crie uma atividade</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <div class="w-100 mb-3">
            <div class="input-group input-group-sm">
              <span class="input-group-text" id="inputGroup-sizing-sm">Titulo</span>
              <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" >
            </div>
          </div>
            <div class="input-group input-group-sm mb-3">
              <span class="input-group-text" id="inputGroup-sizing-sm">Descrição</span>
              <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" >
            </div>
            <div class="w-100 flex-column flex-sm-row d-flex align-items-center mb-3 gap-sm-1">
            <select class="form-select w-100 w-sm-50 mt-3 mt-sm-0" aria-label="Default select example">
              <option selected>Status</option>
              <option value="Concluido">Concluido</option>
              <option value="Em_andamento">Em andamento</option>
              <option value="Cancelado">Cancelado</option>
            </select>
            <select class="form-select w-100 w-sm-50 mt-3 mt-sm-0" aria-label="Default select example" >
              <option selected="Sem prioridade">Sem prioridade</option>
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
            </select>
            <div class="input-group flex-column input-group-sm mb-3  mb-sm-1 w-100 w-sm-auto">
              <input type="date" id="dataEntrega" class="form-control w-100" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
            </div>
          </div>
          </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-cancelar-modal" data-bs-dismiss="modal">Cancelar</button>
          <button type="button" class="btn btn-salvar-modal">Criar atividade</button>
        </div>
      </div>
    </div>
  </div>
  <div class="d-flex flex-column flex-xl-row">
    <div class="w-100 d-flex flex-column raia-atividade">
      <span class="align-self-center mb-3 atividade-status">Atividades Pendentes</span>
      <#list Mock[0].atividades as atividade>
        <#if atividade.status == "Pendente">
            <div class="card w-100 " data-estado="Pendente" data-prioridade="${atividade.prioridade}" data-date="${atividade.dataEntrega}">
              <div class="card-body">
                <h5 class="card-title mb-3">${atividade.titulo}</h5>
                <div class="d-flex mb-2 justify-content-between">
                  <span class="status ${atividade.status} text-align-center situacao">${atividade.status}</span>
                  <div class="d-flex flex-column flex-sm-row gap-2 gap-sm-4">
                    <div class="data-entrega d-flex flex-column flex-sm-row"><span class="mr-2 fw-bold">Entrega:</span> <span>${atividade.dataEntrega}</span></div>
                    <div class="data-entrega d-flex"><span class="mr-2 fw-bold">Prioridade:</span> <span>${atividade.prioridade}</span></div>
                  </div>
                </div>
                <p class="card-text">${atividade.descricao}</p>
                <button type="button" class="btn btn-salvar-modal" data-bs-toggle="modal" data-bs-target="#modal-${atividade.id}">
                  Atualizar
                </button>
              </div>
            </div>         
        </#if>
      </#list>
    </div>
    <div class="separador mx-3"></div>
    <div class="w-100 d-flex flex-column raia-atividade">
      <span class="align-self-center mb-3 atividade-status">Atividades Concluidas</span>
      <#list Mock[0].atividades as atividade>
        <#if atividade.status == "Concluído">
          <div class="card w-100" data-estado="Concluido" data-prioridade="${atividade.prioridade}" data-date="${atividade.dataEntrega}">
            <div class="card-body">
              <h5 class="card-title mb-3">${atividade.titulo}</h5>
              <div class="d-flex mb-2 justify-content-between">
                  <span class="status ${atividade.status} text-align-center situacao">${atividade.status}</span>
                  <div class="d-flex flex-column flex-sm-row gap-2 gap-sm-4">
                    <div class="data-entrega d-flex flex-column flex-lg-row"><span class="mr-2 fw-bold">Entrega:</span> <span>${atividade.dataEntrega}</span></div>
                    <div class="data-entrega d-flex"><span class="mr-2 fw-bold">Prioridade:</span> <span>${atividade.prioridade}</span></div>
                  </div>
                </div>
              <p class="card-text">${atividade.descricao}</p>
              <button type="button" class="btn btn-salvar-modal" data-bs-toggle="modal" data-bs-target="#modal-${atividade.id}">
                Atualizar
              </button>
            </div>
          </div>
        </#if>
      </#list>
    </div>
    <div class="separador mx-3"></div>
    <div class="w-100 d-flex flex-column raia-atividade">
      <span class="align-self-center mb-3 atividade-status">Atividades Canceladas</span>
      <#list Mock[0].atividades as atividade>
        <#if atividade.status == "Cancelado">
          <div class="card w-100" data-estado="Cancelado" data-prioridade="${atividade.prioridade}" data-date="${atividade.dataEntrega}">
            <div class="card-body">
              <h5 class="card-title mb-3">${atividade.titulo}</h5>
              <div class="d-flex mb-2 justify-content-between">
                  <span class="status ${atividade.status} text-align-center situacao">${atividade.status}</span>
                  <div class="d-flex flex-column flex-sm-row gap-2 gap-sm-4">
                    <div class="data-entrega d-flex flex-column flex-lg-row"><span class="mr-2 fw-bold">Entrega:</span> <span>${atividade.dataEntrega}</span></div>
                    <div class="data-entrega d-flex"><span class="mr-2 fw-bold">Prioridade:</span> <span>${atividade.prioridade}</span></div>
                  </div>
                </div>
              <p class="card-text">${atividade.descricao}</p>
              <button type="button" class="btn btn-salvar-modal" data-bs-toggle="modal" data-bs-target="#modal-${atividade.id}">
                Atualizar
              </button>
            </div>
          </div> 
        </#if>
        <!-- Modal -->
          <div class="modal fade" id="modal-${atividade.id}" tabindex="-1" aria-labelledby="${atividade.id}Label" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="${atividade.id}Label">${atividade.titulo}</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" data-bs-target="#${atividade.id}"></button>
                </div>
                <div class="modal-body">
                  <div class="w-100 mb-3">
                      <div class="input-group input-group-sm">
                        <span class="input-group-text" id="inputGroup-sizing-sm">Titulo</span>
                        <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"  value="${atividade.titulo}">
                      </div>
                    </div>
                    <div class="input-group input-group-sm mb-3">
                      <span class="input-group-text" id="inputGroup-sizing-sm">Descrição</span>
                      <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="${atividade.descricao}">
                    </div>
                    <div class="w-100 flex-column flex-sm-row d-flex align-items-center mb-3 gap-sm-1">
                      <select class="form-select w-100 w-sm-50 mt-3 mt-sm-0" aria-label="Default select example">
                        <option selected>${atividade.status}</option>
                        <option value="Concluido">Concluido</option>
                        <option value="Em_andamento">Em andamento</option>
                        <option value="Cancelado">Cancelado</option>
                      </select>
                      <select class="form-select w-100 w-sm-50 mt-3 mt-sm-0" aria-label="Default select example" >
                        <option selected>${atividade.prioridade}</option>
                        <option value="Sem prioridade">Sem prioridade</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                      </select>
                      <div class="input-group flex-column input-group-sm mb-3  mb-sm-1 w-100 w-sm-auto">
                        <input type="date" id="dataEntrega" class="form-control w-100" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="${atividade.dataEntrega?replace('/', '-')?date('dd-MM-yyyy')?string('yyyy-MM-dd')}">
                      </div>
                    </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-cancelar-modal" data-bs-dismiss="modal" data-bs-target="#${atividade.id}">Cancelar</button>
                  <button type="button" class="btn btn-salvar-modal">Salvar mudanças</button>
                </div>
              </div>
            </div>
          </div>
      </#list>
    </div>
    </div>
  </div>
  <script>
  const Mock = [
    <#list Mock as item>
      {
        "atividades": [
          <#list item.atividades as atividade>
            {
              "titulo": "${atividade.titulo?js_string}",
              "descricao": "${atividade.descricao?js_string}",
              "dataEntrega": "${atividade.dataEntrega?js_string}",
              "status": "${atividade.status?js_string}",
              "prioridade": "${atividade.prioridade?js_string}",
              "id": "${atividade.id?js_string}"
            }<#if atividade_has_next>,</#if>
          </#list>
        ]
      }<#if item_has_next>,</#if>
    </#list>
  ];
  async function fetchAtividades() {
  try {
    const response = await Mock[0].atividades;
    console.log(response)
    if (response.length === 0) {
      throw new Error('Nenhuma atividade encontrada');
    }
  } catch (error) {
    console.error('Erro ao buscar atividades:', error.message);
  }
}
  function filterActivities() {
    var selectedPrioridade = document.querySelector('select[name="prioridade"]').value;
    var atividades = document.querySelectorAll('.card');
    atividades.forEach(function(atividade) {
      var prioridade = atividade.getAttribute('data-prioridade');
        if (selectedPrioridade == "Sem prioridade" || prioridade == selectedPrioridade) {
            atividade.style.display = "block";
        } else {
            atividade.style.display = "none";
        }
    });
}
function filterActivitiesByDate() {
    var selectedDate = document.querySelector('input[type="date"]').value;
    var atividades = document.querySelectorAll('.card');
    atividades.forEach(function(atividade) {
        var dataEntrega = atividade.getAttribute('data-date');
        var formattedDate = selectedDate.split('-').reverse().join('/');

        if (formattedDate == "" || dataEntrega <= formattedDate) {
            atividade.style.display = "block";
        } else {
            atividade.style.display = "none";
        }
    });
}
fetchAtividades()
</script>