var express = require('express');
var router = express.Router();
var homeController = require('../app/controllers/home');

router.get('/', homeController.index);
router.get('/pessoas.json', homeController.pessoas);
router.get('/alterar', homeController.alterar);
router.post('/alterar-pessoa.json', homeController.alterar_pessoa_service);
router.post('/alterar-pessoa', homeController.alterar_pessoa);
router.get('/excluir', homeController.excluir);
router.get('/excluir.json', homeController.excluir_service);
router.get('/pesquisar', homeController.pesquisar);
router.get('/ajax-test-html', homeController.ajax_test_html);
router.get('/estados.json', homeController.estados);
router.get('/cidades.json', homeController.cidades);
router.post('/cadastrar-pessoa.json', homeController.cadastrar_pessoa_service);
router.post('/cadastrar-pessoa', homeController.cadastrar_pessoa);

module.exports = router;
