|  |  |  |
| ----- | ----- | ----------- |
{% for file in files %}| {% if file.image %} ![](resource:{{ file.image }}) {% endif %} | [{{ file.title }}](resource:content{{ content }}/{{ file.slug }}) | {{ file.description }} |
{% endfor %}
