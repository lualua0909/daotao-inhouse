@if ($paginator->lastPage() > 1)
    <div class="admin-pagination">
        <span class="text">{{$paginator->lastPage()}} mục</span>
        <div class="pagination-wrap">
            <span>
                <a class="btn btn-block btn-outline-info btn-sm {{ ($paginator->currentPage() == 1) ? ' disabled' : '' }}"
                   href="{{ $paginator->url(1) }}">«</a>
            </span>
            <span>
                <a class="btn btn-block btn-outline-info btn-sm {{ ($paginator->currentPage() == 1) ? ' disabled' : '' }}"
                   href="{{ $paginator->url($paginator->currentPage()-1) }}">‹</a>
            </span>
            <span class="text">{{$paginator->currentPage() . " trên " . $paginator->lastPage()}}</span>
            <span>
                <a class="btn btn-block btn-outline-info btn-sm {{ ($paginator->currentPage() == $paginator->lastPage()) ? ' disabled' : '' }}"
                   href="{{ $paginator->url($paginator->currentPage()+1) }}">›</a>
            </span>
            <span>
                <a class="btn btn-block btn-outline-info btn-sm {{ ($paginator->currentPage() == $paginator->lastPage()) ? ' disabled' : '' }}"
                   href="{{ $paginator->url($paginator->lastPage()) }}">»</a>
            </span>
        </div>
    </div>
@endif
