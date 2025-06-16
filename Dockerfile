# Use official n8n image
FROM n8nio/n8n

# Expose port
EXPOSE 5678

# Start n8n
CMD ["n8n"]
