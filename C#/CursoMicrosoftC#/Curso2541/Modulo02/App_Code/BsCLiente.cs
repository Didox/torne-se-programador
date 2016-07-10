using System;
using System.Collections.Generic;
using System.Data;

public class BsClientes : List<BsCliente> { }

public class BsCliente
{
    public BsCliente(){}
    public BsCliente(int id_, string nome_)
    {
        _id   = id_;
        _nome = nome_;
    }

    private int _id;
    private string _nome;

    public int Id
    {
        get { return _id; }
        //set { _id = value; }
    }

    public string Nome
    {
        get { return _nome == null ? "" : _nome; }
        set { _nome = value; }
    }

    public int Gravar() { return DaClientes.Gravar(this); }

    public BsClientes GetClientes() { return DaClientes.GetClientes(this); }
    public DataSet GetClientesOffLine() { return DaClientes.GetClientesOffLine(this); }
}
